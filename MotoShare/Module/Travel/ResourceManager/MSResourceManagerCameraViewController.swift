//
//  MSResourceManagerCameraViewController.swift
//  MotoShare
//
//  Created by houhanglei on 2019/11/30.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import AVFoundation

class MSResourceManagerCameraViewController: BaseViewController,AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var delegate: MSResourceManagerViewControllerDelegate?
    
    /// 最多选择数量
    var maxNo: Int = 9
    
    /// 获取设备：如摄像头
    var device: AVCaptureDevice!
    
    /// 相机开始拍照
    var beganTakePicture: Bool = false
    
    /// 拍摄的所有照片
    var images: [UIImage] = []
    
    /// 底部拍照view的高度
    var bottomBarViewHeight = SCREEN_HEIGHT - (SCREEN_WIDTH * 4 / 3) - 45
    
    /// 会话，协调着input到output的数据传输，input和output的桥梁
    lazy var captureSession: AVCaptureSession = {
        
        let session = AVCaptureSession.init()
        session.sessionPreset = .photo
        
        let availbleDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back).devices
        self.device = availbleDevices.first

        return session
    }()
    
    /// 图像预览层
    lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        
        let layer = AVCaptureVideoPreviewLayer.init(session: self.captureSession)
        layer.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH * 4 / 3)
        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        return layer
    }()
    
    /// 图像流输入
    lazy var input: AVCaptureDeviceInput? = {
        
        do {
            
            let captureDeviceInput = try AVCaptureDeviceInput(device: self.device)
            return captureDeviceInput
        
        }catch {
            
            return nil
        }
    }()
    
    /// 图像流输出
    lazy var output: AVCaptureVideoDataOutput = {
        
        let output = AVCaptureVideoDataOutput.init()
        output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String : kCVPixelFormatType_32BGRA]
        output.alwaysDiscardsLateVideoFrames = true
                
        return output
    }()
    
    /// 底部拍照等view
    lazy var bottomToolBarView: MSCameraBottolToolBarView = {
        
        let view = MSCameraBottolToolBarView.view()
        view.delegate = self
        view.maxNo = self.maxNo
        view.layer.zPosition = 1
        self.view.addSubview(view)
        
        return view
    }()
    
    /// 导航栏View
    lazy var navigationBarView: MSCameraNavigationBarView = {
        
        let view = MSCameraNavigationBarView.view()
        view.delegate = self
        view.layer.zPosition = 1
        self.view.addSubview(view)
        
        return view
    }()
    
    /// 当前拍的所有照片
    lazy var imageListView: MSCameraImageListView = {
        
        let view = MSCameraImageListView.view()
        view.delegate = self
        view.layer.zPosition = 1
        self.view.addSubview(view)
        
        return view
    }()
    
    deinit {
        
        print("124")
        self.captureSession.stopRunning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bottomToolBarView.snp.makeConstraints { (make) in
            
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(bottomBarViewHeight)
        }
        
        self.navigationBarView.snp.makeConstraints { (make) in
            
            make.left.right.top.equalToSuperview()
            make.height.equalTo(HBS_C_NAVIGATION_HEIGHT_ADD_STATUS_HEIGHT)
        }
        
        self.imageListView.snp.makeConstraints { (make) in
            
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.bottomToolBarView.snp.top).offset(0)
            make.height.equalTo(80)
        }
        
        self.captureSession.beginConfiguration()
        
        if self.input != nil {
            
            self.captureSession.addInput(self.input!)

        }else {
            
            HBSProgressHUD.hbs_showError(title: "获取输入流失败...")

        }

        self.view.layer.addSublayer(self.previewLayer)

        if self.captureSession.canAddOutput(output) {
            
            self.captureSession.addOutput(output)
        }

//        beginConfiguration()和commitConfiguration()方法中的修改将在commit时同时提交
        self.captureSession.commitConfiguration()
        self.captureSession.startRunning()
        
//        开新线程进行输出流代理方法调用
        let queue = DispatchQueue(label: "com.brianadvent.captureQueue")
        self.output.setSampleBufferDelegate(self, queue: queue)
        
        let caputureConnection = self.output.connection(with: .video)
        if caputureConnection?.isVideoStabilizationSupported == true {
            
            caputureConnection?.videoOrientation = self.getCaptureVideoOrientation()
        }
    }
    
    func addInput() {
        
//        self.captureSession.beginConfiguration()
        self.captureSession.startRunning()

    }
    
    func hbs_viewEvent(_ view: UIView, hbs_eventObject: HBSViewEventObject) {
        
        if hbs_eventObject.hbs_eventType == "关闭" {
            
            self.dismiss(animated: true, completion: nil)
       
        }else if hbs_eventObject.hbs_eventType == "拍照" {
            
            self.beganTakePicture = true
       
        }else if hbs_eventObject.hbs_eventType == "切换摄像头" {
            
            self.switchCamera()
        
        }else if hbs_eventObject.hbs_eventType == "删除图片" {
            
            self.images.removeAll(hbs_eventObject.hbs_params as! UIImage)
            self.imageListView.updateCameraImageListView(datas: self.images)
        
            self.bottomToolBarView.updateCurrentNo(no: self.images.count)

        }else if hbs_eventObject.hbs_eventType == "打开闪光灯" {
          
            self.switchLamp(torchModel: .on)

        }else if hbs_eventObject.hbs_eventType == "关闭闪光灯" {
          
            self.switchLamp(torchModel: .off)

        }else if hbs_eventObject.hbs_eventType == "下一步" {
            
            if self.delegate != nil {
                
                var msAssets: [MSPHAsset] = []
                
                for image in self.images {
                    
                    let msAsset = MSPHAsset.init()
                    msAsset.mediaType = .image
                    msAsset.originalImage = image
                    
                    msAssets.append(msAsset)
                }
                
                self.delegate?.imageChoiceFinish?(assets: msAssets)
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
// MARK:- AVCaptureVideoDataOutputSampleBufferDelegate
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        if self.beganTakePicture == true {
            
            self.beganTakePicture = false
            
            DispatchQueue.main.async {
                    
                var image = self.imageConvert(sampleBuffer: sampleBuffer)
                
                /// 剪辑图片
//                let clipImage = image?.clipImage(rect: self.previewLayer.bounds)
                
                if image != nil {
                    
                    let newImage = image!.copy() as! UIImage
                    
                    image = nil
                    
                    self.images.append(newImage)
                    self.imageListView.updateCameraImageListView(datas: self.images)
                    
                    self.bottomToolBarView.updateCurrentNo(no: self.images.count)
                }
            }
        }
    }
    
// MARK:- 转换Image
    func imageConvert(sampleBuffer: CMSampleBuffer?) -> UIImage? {
        
        guard sampleBuffer != nil && CMSampleBufferIsValid(sampleBuffer!) == true else {
            
            return nil
        }
        
        let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer!)
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer!)
        return UIImage(ciImage: ciImage)
    }
    
// MARK:- 旋转方向
    func getCaptureVideoOrientation() -> AVCaptureVideoOrientation {
        
        switch UIDevice.current.orientation {
        case .portrait,.faceUp,.faceDown:
            return .portrait
        case .portraitUpsideDown:
            return .portrait
        case .landscapeLeft:
            return .landscapeRight
        case .landscapeRight:
            return .landscapeLeft

        default:
            return .portrait
        }
    }
    
// MARK:- 前后摄像头切换事件
    func switchCamera() {
                
//        获取之前的摄像头
        guard var position = self.input?.device.position else { return }
        
//        获取应该显示的摄像头
        position = position == .front ? .back : .front

        if position == .front {
            self.navigationBarView.switchLampButton.isSelected = false
            self.navigationBarView.switchLampButton.isEnabled = false
            self.switchLamp(torchModel: .off)
        }else {
            self.navigationBarView.switchLampButton.isEnabled = true
        }
        
//        创建新的devices
        self.device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: position).devices.first
        
        guard let videoInput = try? AVCaptureDeviceInput(device: self.device) else { return }
        
        self.captureSession.beginConfiguration()
        self.captureSession.removeInput(self.input!)
        self.captureSession.addInput(videoInput)
        self.captureSession.commitConfiguration()
        self.captureSession.startRunning()
        self.input = videoInput
        
        let caputureConnection = self.output.connection(with: .video)
//        if caputureConnection?.isVideoStabilizationSupported == true {
            
            caputureConnection?.videoOrientation = self.getCaptureVideoOrientation()
//        }

    }
    
// MARK:- 闪光灯开关
    func switchLamp(torchModel: AVCaptureDevice.TorchMode) {
        
        let device: AVCaptureDevice = AVCaptureDevice.default(for: .video)!
        
        try! device.lockForConfiguration()
        
        device.torchMode = torchModel
        device.unlockForConfiguration()

    }
    
}
