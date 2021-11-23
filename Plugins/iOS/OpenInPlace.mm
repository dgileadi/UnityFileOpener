#import "OpenInPlace.h"

static OpenInPlace *openInPlace;

@implementation OpenInPlace

UIDocumentInteractionController* dic = nil;

- (BOOL) openInPlace:(NSString *)url uti:(NSString *)uti name:(NSString *)name {
    dic = [UIDocumentInteractionController interactionControllerWithURL:[NSURL URLWithString:url]];
    dic.delegate = self;
    if (uti != nil)
        dic.UTI = uti;
    if (name != nil)
        dic.name = name;
    return [dic presentOpenInMenuFromRect:CGRectZero inView:UnityGetGLView() animated:YES];
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller
        willBeginSendingToApplication:(NSString *)application {
    [dic dismissMenuAnimated:NO];
    [dic dismissMenuAnimated:NO];
}

extern "C" {
    void UFO_OpenInPlace(char* url, char* uti, char* name) {
        openInPlace = [[OpenInPlace alloc] init];
        [openInPlace openInPlace:[DataConvertor charToNSString:url] uti:[DataConvertor charToNSString:uti] name:[DataConvertor charToNSString:name]];
    }
}

@end
