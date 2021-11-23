#import <Foundation/Foundation.h>
#import "DataConvertor.h"

@interface OpenInPlace : NSObject <UIDocumentInteractionControllerDelegate>

- (BOOL) openInPlace:(NSString *)url uti:(NSString *)uti name:(NSString *)name;

@end
