//
//  ScaleHelper.m
//  Kollekt
//
//  Created by Vik Denic on 8/14/16.
//  Copyright © 2016 vikzilla. All rights reserved.
//

#import "ScaleHelper.h"

@implementation ScaleHelper

+ (void)scrollViewWillEndDragging:(UIScrollView *)scrollView forCollectionView:(UICollectionView *)collectionView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset transformCellValue:(CGAffineTransform)transformCellValue animationSpeed:(double)animationSpeed
{
    float pageWidth = 200 + 30; // width + space

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

    int index = newTargetOffset / pageWidth;

    if (index == 0) { // If first index
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index  inSection:0]];

        [UIView animateWithDuration:animationSpeed animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
        cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index + 1  inSection:0]];
        [UIView animateWithDuration:animationSpeed animations:^{
            cell.transform = transformCellValue;
        }];
    }else{
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
        [UIView animateWithDuration:animationSpeed animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];

        index --; // left
        cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
        [UIView animateWithDuration:animationSpeed animations:^{
            cell.transform = transformCellValue;
        }];

        index ++;
        index ++; // right
        cell = [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
        [UIView animateWithDuration:animationSpeed animations:^{
            cell.transform = transformCellValue;
        }];
    }
}

@end
