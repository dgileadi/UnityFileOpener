#import <Foundation/Foundation.h>

@interface OpenInPlace : NSObject <UIDocumentInteractionControllerDelegate>

- (BOOL) openInPlace:(NSString *)url uti:(NSString *)uti;

@end
