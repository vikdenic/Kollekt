//
//  ScaleHelper.m
//  Kollekt
//
//  Created by Vik Denic on 8/14/16.
//  Copyright © 2016 vikzilla. All rights reserved.
//

#import "ScaleHelper.h"

@implementation ScaleHelper

+ (void)scrollViewWillEndDragging:(UIScrollView *)scrollView forCollectionView:(UICollectionView *)collectionView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    float pageWidth = 250 + 10; // width + space

    float currentOffset = scrollView.contentOffset.x;
    float targetOffset = targetContentOffset->x;
    float newTargetOffset = 0;

    if (targetOffset > currentOffset) {
        newTargetOffset = ceilf(currentOffset / pageWidth) * pageWidth;
    } else {
        newTargetOffset = floorf(currentOffset / pageWidth) * pageWidth;
    }

    if (newTargetOffset < 0)
        newTargetOffset = 0;
    else if (newTargetOffset > scrollView.contentSize.width)
        newTargetOffset = scrollView.contentSize.width;

    targetContentOffset->x = currentOffset;
    [scrollView setContentOffset:CGPointMake(newTargetOffset, 0) animated:YES];
}

@end
