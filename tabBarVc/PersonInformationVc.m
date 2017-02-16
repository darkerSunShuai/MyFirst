//
//  PersonInformationVc.m
//  SmartCampus;
//
//  Created by qiuqiu on 2017/1/9.
//  Copyright © 2017年 qiuqiu. All rights reserved.
//

#import "PersonInformationVc.h"

@interface PersonInformationVc ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation PersonInformationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatUi];
}
-(void)creatUi
{
    self.title = @"个人信息";
    _pImg.layer.masksToBounds=YES;
    _pImg.layer.cornerRadius=_pImg.frame.size.width/2.3f; //设置为图片宽度的一半出来为圆形（根据取值自己设定）
    _pImg.layer.borderWidth=3.0f; //边框宽度
    _pImg.layer.borderColor=[[UIColor whiteColor] CGColor];//边框颜色
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickedTheImage)];//响应方法没写
    _pImg.userInteractionEnabled=YES;   ///必须设置用户交互，手势才有用
    
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(imglongTapClick:)];
    [_pImg addGestureRecognizer:longTap];
    [_pImg addGestureRecognizer:tap];
}
#pragma mark - 长按图片
-(void)imglongTapClick:(UILongPressGestureRecognizer*)gesture
{
    if(gesture.state==UIGestureRecognizerStateBegan)
    {
    NSLog(@"长按了照片！");
        //创建对象
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle: UIAlertControllerStyleActionSheet];

        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"保存至相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了保存至相册");
                UIImageWriteToSavedPhotosAlbum(self.pImg.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }];
        
        [alertController addAction:cancelAction];
        
        [alertController addAction:deleteAction];
        
        [self presentViewController:alertController animated:YES completion:nil];

    }
}
#pragma mark - 保存图片后的回掉，判断是否保存成功
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (error == nil) {
        
        //弹出窗口响应点击事件
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        
        //弹出窗口响应点击事件
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"保存失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
#pragma mark - 点击图片的方法（断按）
-(void)clickedTheImage
{
    NSLog(@"点击了头像");
    //创建对象
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了拍照");
        [self readImageFromCamera];
    }];
    
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"从相册中选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self readImageFromAlbum];
    }];
    
    [alertController addAction:cancelAction];
    
    [alertController addAction:deleteAction];
    
    [alertController addAction:archiveAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
#pragma mark - 读取相册
-(void)readImageFromAlbum
{
   
        //创建对象
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        //（选择类型）表示仅仅从相册中选取照片
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //指定代理，因此我们要实现UIImagePickerControllerDelegate,

        imagePicker.delegate = self;
        //设置在相册选完照片后，是否跳到编辑模式进行图片剪裁。(允许用户编辑)
        imagePicker.allowsEditing = YES;
        //显示相册
        [self presentViewController:imagePicker animated:YES completion:nil];

        
    
}
#pragma mark - 拍照上传
- (void)readImageFromCamera {
    
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES; //允许用户编辑
        [self presentViewController:imagePicker animated:YES completion:nil];
    } else {
        //弹出窗口响应点击事件
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"未检测到摄像头" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
//图片完成之后处理
#pragma mark - 选取图片后更改图片
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    //image 就是修改后的照片
    //将图片添加到对应的视图上
    [_pImg setImage:image];
    //结束操作
    [self dismissViewControllerAnimated:YES completion:nil];
}
//-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
//    [picker dismissViewControllerAnimated:YES completion:^{}];
//}
- (IBAction)send:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
