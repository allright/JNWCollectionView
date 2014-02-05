//
//  JNWCollectionViewLinearLayout.h
//  JNWCollectionView
//
//  Created by Andrey Syvrachev on 05.02.14.
//  Copyright (c) 2014 AppJon. All rights reserved.
//

#import "JNWCollectionViewLayout.h"

extern NSString * const JNWCollectionViewLinearLayoutHeaderKind;
extern NSString * const JNWCollectionViewLinearLayoutFooterKind;

@protocol JNWCollectionViewLinearLayoutDelegate <NSObject>

@optional
/// Asks the delegate for the height of the header or footer in the specified section.
///
/// The default height for both the header and footer is 0.
- (CGFloat)collectionView:(JNWCollectionView *)collectionView heightForHeaderInSection:(NSInteger)index;
- (CGFloat)collectionView:(JNWCollectionView *)collectionView heightForFooterInSection:(NSInteger)index;

@end

@interface JNWCollectionViewLinearLayout : JNWCollectionViewLayout

@property (nonatomic, strong) NSMutableArray *sections;

@end
