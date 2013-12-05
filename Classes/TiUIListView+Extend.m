#import "TiUIListView+Extend.h"

@implementation TiUIListView (Extend)

// scroll event
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.isDragging || scrollView.isDecelerating) {
        if ([self.proxy _hasListeners:@"scroll"]) {
            [self.proxy fireEvent:@"scroll"
                       withObject:@{
                                    @"contentOffset": [TiUtils pointToDictionary:scrollView.contentOffset],
                                    @"contentSize": [TiUtils sizeToDictionary:scrollView.contentSize],
                                    @"size": [TiUtils sizeToDictionary:self.tableView.bounds.size]
                                    }];
        }
    }
}


// scrollend event
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([self.proxy _hasListeners:@"scrollend"]) {
        [self.proxy fireEvent:@"scrollend"
                   withObject:@{
                                @"contentOffset": [TiUtils pointToDictionary:scrollView.contentOffset],
                                @"contentSize": [TiUtils sizeToDictionary:scrollView.contentSize],
                                @"size": [TiUtils sizeToDictionary:self.tableView.bounds.size]
                                }];
    }
}


// dragstart event
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if([self.proxy _hasListeners:@"dragstart"]) {
        [self.proxy fireEvent:@"dragstart"
                   withObject:nil];
    }
}


// dragend event
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if ([self.proxy _hasListeners:@"dragend"]) {
        [self.proxy fireEvent:@"dragend"
                   withObject:@{
                                @"decelerate": @(decelerate)
                                }];
    }
}

@end
