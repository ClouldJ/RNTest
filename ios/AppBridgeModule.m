//
//  AppBridgeModule.m
//  CutoutImage
//
//  Created by Pors0he on 2023/12/29.
//

#import "AppBridgeModule.h"

#import "ImageUtils.h"

@implementation AppBridgeModule
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(cutoutImage:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject) {
  dispatch_async(dispatch_get_main_queue(), ^{
    NSString *imagePath = [ImageUtils cutoutImagePath];
    
    if(![ImageUtils isNull:imagePath]) {
      resolve(imagePath);
    }else{
      reject(@"-1", @"抠图失败", nil);
    }
  });
  
}

@end
