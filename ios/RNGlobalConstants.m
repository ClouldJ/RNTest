//
//  RNGlobalConstants.m
//  CutoutImage
//
//  Created by Pors0he on 2023/12/29.
//

#import "RNGlobalConstants.h"

#import <React/RCTConvert.h>

@implementation RNGlobalConstants
RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport {
  
  return @{
    @"userToken": @"",
    @"environment": @""
  };
}

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

@end
