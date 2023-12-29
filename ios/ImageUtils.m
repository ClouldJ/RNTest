//
//  ImageUtils.m
//  CutoutImage
//
//  Created by Pors0he on 2023/12/29.
//

#import "ImageUtils.h"

@interface ImageUtils ()

@end

@implementation ImageUtils

+(UIImage *)cutoutImage {
  UIImage *origin = [UIImage imageNamed:@"origin"];
  UIImage *mask = [UIImage imageNamed:@"mask.jpeg"];

  UIImage *inputImage = mask;
  CGImageRef inputCGImage = [inputImage CGImage];
     
  size_t width = CGImageGetWidth(inputCGImage);
  size_t height = CGImageGetHeight(inputCGImage);
     
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
     
  void *rawData = malloc(width * height * 4);
  
  CGContextRef context = CGBitmapContextCreate(rawData, width, height, 8, width * 4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
  
  CGContextDrawImage(context, CGRectMake(0, 0, width, height), inputCGImage);
  
  UInt32 *pixelData = (UInt32 *)CGBitmapContextGetData(context);
  
  for (int i = 0; i < width * height; i++) {
      UInt32 pixelColor = pixelData[i];
      
      UInt32 redColor = (pixelColor >> 16) & 0xFF;
      
      if (redColor == 0) {
          pixelData[i] = 0;
      }
  }
     
  CGImageRef outputCGImage = CGBitmapContextCreateImage(context);
  
  free(rawData);
  CGContextRelease(context);
  CGColorSpaceRelease(colorSpace);
  
  UIImage *outputImage = [UIImage imageWithCGImage:outputCGImage];
  
  UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"origin"]];
  imageView.frame = CGRectMake(0, 0, 240, 192);

  CALayer *ly = [CALayer new];
  ly.frame = imageView.bounds;
  ly.contents = (id)outputImage.CGImage;
  imageView.layer.mask = ly;

  // 释放 CGImageRef
  CGImageRelease(outputCGImage);
  
  return [self imageFromView:imageView];
}

+(UIImage *)imageFromView:(UIView *)view{
  UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0);
  [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
  UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return theImage;

}

+(NSString *)cutoutImagePath {
  NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
  docPath = [docPath stringByAppendingPathComponent:@"/final.jpeg"];
  UIImage *image = [self cutoutImage];
  NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
  [imageData writeToFile:docPath atomically:YES];
  return docPath;
}

+(BOOL)isNull:(NSObject *)obj{
    if([obj isKindOfClass:[NSString class]])
    {
        //字符串
       NSString *tmpObj = (NSString*)obj;
        if(tmpObj.length == 0 || tmpObj == NULL || [tmpObj isEqualToString:@""] || tmpObj == nil || [tmpObj isEqualToString:@"(null)"] || [tmpObj isEqualToString:@"null"] || [tmpObj isEqualToString:@"(null)\n"] || [tmpObj isEqualToString:@"<null>"] || [tmpObj isEqualToString:@"Nan"] || [tmpObj isEqualToString:@"NaN"] || [tmpObj isEqualToString:@"nan"])
        {
            return YES;
        }
    }else if([obj isKindOfClass:[NSNull class]])
    {
        return YES;
    }else if(obj == nil)
    {
        return YES;
    }
    return NO;
}

@end
