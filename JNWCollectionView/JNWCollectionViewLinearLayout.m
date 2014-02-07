//
//  JNWCollectionViewLinearLayout.m
//  JNWCollectionView
//
//  Created by Andrey Syvrachev on 05.02.14.
//  Copyright (c) 2014 AppJon. All rights reserved.
//

#import "JNWCollectionViewLinearLayout+Protected.h"
#import "JNWCollectionViewLinearLayoutSection.h"

NSString * const JNWCollectionViewLinearLayoutHeaderKind = @"JNWCollectionViewLinearLayoutHeader";
NSString * const JNWCollectionViewLinearLayoutFooterKind = @"JNWCollectionViewLinearLayoutFooter";

@implementation JNWCollectionViewLinearLayout

- (NSMutableArray *)sections {
	if (_sections == nil) {
		_sections = [NSMutableArray array];
	}
	return _sections;
}

- (JNWCollectionViewLayoutAttributes *)layoutAttributesForSupplementaryItemInSection:(NSInteger)sectionIdx kind:(NSString *)kind {
	JNWCollectionViewLinearLayoutSection *section = self.sections[sectionIdx];
	CGFloat width = self.collectionView.visibleSize.width;
	CGRect frame = CGRectZero;
	
	if ([kind isEqualToString:JNWCollectionViewLinearLayoutHeaderKind]) {
		frame = CGRectMake(0, section.offset, width, section.headerHeight);
		
		if (self.stickyHeaders) {
			// Thanks to http://blog.radi.ws/post/32905838158/sticky-headers-for-uicollectionview-using for the inspiration.
			CGPoint contentOffset = self.collectionView.documentVisibleRect.origin;
			CGPoint nextHeaderOrigin = CGPointMake(FLT_MAX, FLT_MAX);
			
			if (sectionIdx + 1 < self.sections.count) {
				NSUInteger nextSectionIdx = sectionIdx + 1;
				if (nextSectionIdx < self.sections.count) {
					JNWCollectionViewLinearLayoutSection *section = self.sections[nextSectionIdx];
					nextHeaderOrigin = section.frame.origin;
				}
			}
			
			frame.origin.y = MIN(MAX(contentOffset.y, frame.origin.y), nextHeaderOrigin.y - CGRectGetHeight(frame) - section.footerHeight);
		}
	} else if ([kind isEqualToString:JNWCollectionViewLinearLayoutFooterKind]) {
		frame = CGRectMake(0, section.offset + section.height - section.footerHeight, width, section.footerHeight);
	}
	
	JNWCollectionViewLayoutAttributes *attributes = [[JNWCollectionViewLayoutAttributes alloc] init];
	attributes.frame = frame;
	attributes.alpha = 1.f;
	attributes.zIndex = NSIntegerMax;
	return attributes;
}

- (BOOL)shouldApplyExistingLayoutAttributesOnLayout {
	return self.stickyHeaders;
}

- (CGRect)rectForItemAtIndexPath:(NSIndexPath*)indexPath
{
	NSAssert(0, @"method %s must be implemented in subclasses",__FUNCTION__);
	return CGRectZero;
}

- (JNWCollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
	JNWCollectionViewLayoutAttributes *attributes = [[JNWCollectionViewLayoutAttributes alloc] init];
	attributes.frame = [self rectForItemAtIndexPath:indexPath];
	attributes.alpha = 1.f;
	return attributes;
}

@end
