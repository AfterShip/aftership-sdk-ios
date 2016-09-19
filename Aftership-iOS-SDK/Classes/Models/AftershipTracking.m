//
// Created by Feiko Lai on 30/7/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import "AftershipTracking.h"
#import "AftershipCheckpoint.h"
#import "AftershipGetLastCheckpointResponse.h"


@implementation AftershipTracking {

}

+ (RKObjectMapping *)responseMapping
{
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
  [mapping addAttributeMappingsFromDictionary:[[self class] mappingDictionary]];
  [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"checkpoints" toKeyPath:@"checkpoints" withMapping:[[AftershipCheckpoint class] responseMapping]]];
  return mapping;
}

+ (NSDictionary *)mappingDictionary
{
  return @{
          @"created_at" : @"createTime",
          @"updated_at" : @"updateTime",
          @"id" : @"identifier",
          @"tracking_number" : @"trackingNumber",
          @"tracking_postal_code" : @"trackingPostalCode",
          @"tracking_ship_date" : @"trackingShipDate",
          @"tracking_account_number" : @"trackingAccountNumber",
          @"tracking_destination_country":@"trackingDestinationCountry",
          @"tracking_key":@"trackingKey",
          @"slug" : @"slug",
          @"active" : @"isActive",
          @"custom_fields" : @"customFields",
          @"customer_name" : @"customName",
          @"delivery_time" : @"deliveryTime",
          @"destination_country_iso3" : @"destionationCountryCode",
          @"emails" : @"emails",
          @"expected_delivery" : @"expectedDeliveryDate",
          @"order_id" : @"orderId",
          @"order_id_path" : @"orderIdPath",
          @"origin_country_iso3" : @"originCountryCode",
          @"unique_token" : @"uniqueToken",
          @"shipment_package_count" : @"shipmentPackageCount",
          @"shipment_type" : @"shipmentType",
          @"shipment_weight" : @"shipmentWeight",
          @"shipment_weight_unit" : @"shipmentWeightUnit",
          @"signed_by" : @"signedBy",
          @"smses" : @"smses",
          @"source" : @"source",
          @"tag" : @"tag",
          @"title" : @"title",
          @"tracked_count" : @"trackedCount",
          @"android":@"android",
          @"ios":@"ios"
  };
}


- (NSString *)description {
  NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
  [description appendFormat:@"self.createTime=%@", self.createTime];
  [description appendFormat:@", self.updateTime=%@", self.updateTime];
  [description appendFormat:@", self.identifier=%@", self.identifier];
  [description appendFormat:@", self.trackingNumber=%@", self.trackingNumber];
  [description appendFormat:@", self.trackingPostalCode=%@", self.trackingPostalCode];
  [description appendFormat:@", self.trackingShipDate=%@", self.trackingShipDate];
  [description appendFormat:@", self.trackingAccountNumber=%@", self.trackingAccountNumber];
  [description appendFormat:@", self.trackingDestinationCountry=%@", self.trackingDestinationCountry];
  [description appendFormat:@", self.trackingKey=%@", self.trackingKey];
  [description appendFormat:@", self.slug=%@", self.slug];
  [description appendFormat:@", self.isActive=%@", self.isActive];
  [description appendFormat:@", self.customFields=%@", self.customFields];
  [description appendFormat:@", self.customName=%@", self.customName];
  [description appendFormat:@", self.delivery_time=%@", self.deliveryTime];
  [description appendFormat:@", self.destionationCountryCode=%@", self.destionationCountryCode];
  [description appendFormat:@", self.emails=%@", self.emails];
  [description appendFormat:@", self.expectedDeliveryDate=%@", self.expectedDeliveryDate];
  [description appendFormat:@", self.orderId=%@", self.orderId];
  [description appendFormat:@", self.orderIdPath=%@", self.orderIdPath];
  [description appendFormat:@", self.originCountryCode=%@", self.originCountryCode];
  [description appendFormat:@", self.uniqueToken=%@", self.uniqueToken];
  [description appendFormat:@", self.shipmentPackageCount=%@", self.shipmentPackageCount];
  [description appendFormat:@", self.shipmentType=%@", self.shipmentType];
  [description appendFormat:@", self.shipmentWeight=%@", self.shipmentWeight];
  [description appendFormat:@", self.shipmentWeightUnit=%@", self.shipmentWeightUnit];
  [description appendFormat:@", self.signedBy=%@", self.signedBy];
  [description appendFormat:@", self.smses=%@", self.smses];
  [description appendFormat:@", self.android=%@", self.android];
  [description appendFormat:@", self.ios=%@", self.ios];
  [description appendFormat:@", self.source=%@", self.source];
  [description appendFormat:@", self.tag=%@", self.tag];
  [description appendFormat:@", self.title=%@", self.title];
  [description appendFormat:@", self.trackedCount=%@", self.trackedCount];
  [description appendFormat:@", self.checkpoints=%@", self.checkpoints];
  [description appendString:@">"];
  return description;
}


-(NSUInteger)hash{
  return self.description.hash;
}


-(BOOL)isEqual:(id)object{
  
  if (self == object) {
    return YES;
  }
  
  if (![object isKindOfClass:[self class]]) {
    return NO;
  }
  
  AftershipTracking *castedObject = (AftershipTracking *)object;
  return castedObject.description == self.description;
  
}


@end
