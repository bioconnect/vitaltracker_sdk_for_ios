//
//  OpenCVWrapper.h
//  unours
//
//  Created by 유호준 on 2023/09/26.
//

#ifndef OpenCVWrapper_h
#define OpenCVWrapper_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface OpenCVWrapper: NSObject

+ (NSArray<NSNumber *>* _Nonnull) skinSegmentation: (const UIImage* _Nonnull) image;

@end

#endif /* OpenCVWrapper_h */
