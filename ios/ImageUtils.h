//
//  ImageUtils.h
//  CutoutImage
//
//  Created by Pors0he on 2023/12/29.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageUtils : NSObject

+(UIImage *)cutoutImage;

+(NSString *)cutoutImagePath;

+(BOOL)isNull:(NSObject *)obj;

@end

NS_ASSUME_NONNULL_END
