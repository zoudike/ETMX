//
//  Test.m
//  ETMX
//
//  Created by 杨香港 on 2016/10/30.
//  Copyright © 2016年 杨香港. All rights reserved.
//

#import "Test.h"
#import "NetWorkManager.h"
@implementation Test
-(void)soapRequestTest{
    NSArray *paramters = @[@"SGS000359"];
    NSString *urlStr = @"http://192.168.1.161:8085/ETMX/services/TaskScanExecution";
    NSString *methodName = @"getTasksByUserCode";
//URL:http://192.168.1.161:8085/ETMX/services/TaskScanExecution?wsdl


    [NetWorkManager sendRequestWith:paramters url:urlStr method:methodName success:^(id data) {
        NSError *error = nil;
        NSDictionary *dict = [XMLReader dictionaryForXMLData:data error:&error];
        NSDictionary *dict1 = [dict valueForKey:@"soap:Envelope"];
        NSDictionary *dict2 = [dict1 valueForKey:@"soap:Body"];
        NSDictionary *dict3 = [dict2 valueForKey:@"ns1:getTasksByUserCodeResponse"];//该字段根据实践情况获得
        NSDictionary *dict4 = [dict3 valueForKey:@"ns1:out"];
        NSString *str = [dict4 valueForKey:@"text"];
        NSData *newData = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSXMLParser *p = [[NSXMLParser alloc] initWithData:newData];
        [p setDelegate:self];
        [p parse];
    } failure:^(NSError *error) {
        //错误输出
        NSLog(@"%@",error);
    }];
}
//以下代理是具体情况实现
-(void)parserDidStartDocument:(NSXMLParser *)parser{
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"节点＝＝%@",elementName);
    
}
-(void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment{
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
}
@end
