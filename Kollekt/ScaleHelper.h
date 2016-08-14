//
//  ScaleHelper.h
//  Kollekt
//
//  Created by Vik Denic on 8/14/16.
//  Copyright © 2016 vikzilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ScaleHelper : NSObject

+ (void)scrollViewWillEndDragging:(UIScrollView *)scrollView forCollectionView:(UICollectionView *)collectionView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;

@end
