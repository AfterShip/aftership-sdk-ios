//
// Created by Feiko Lai on 2/8/14.
// Copyright (c) 2014 Aftership. All rights reserved.
//

#import <Foundation/Foundation.h>

//sdk version
static NSString *AFTERSHIP_IOS_SDK_VERSION = @"1.1.1";

//tracking tags
static NSString *AftershipTrackingTagPending = @"Pending";
static NSString *AftershipTrackingTagInTransit = @"InTransit";
static NSString *AftershipTrackingTagOutForDelivery = @"OutForDelivery";
static NSString *AftershipTrackingTagAttemptFail = @"AttemptFail";
static NSString *AftershipTrackingTagDelivered = @"Delivered";
static NSString *AftershipTrackingTagException = @"Exception";
static NSString *AftershipTrackingTagExpired = @"Expired";
static NSString *AftershipTrackingTagInfoReceived = @"InfoReceived";

//tracking fields
static NSString *AftershipTrackingFieldTitle = @"title";
static NSString *AftershipTrackingFieldOrderId = @"order_id";
static NSString *AftershipTrackingFieldTag = @"tag";
static NSString *AftershipTrackingFieldCheckpoints = @"checkpoints";
static NSString *AftershipTrackingFieldCheckpointTime = @"checkpoint_time";
static NSString *AftershipTrackingFieldMessage = @"message";
static NSString *AftershipTrackingFieldCountryName = @"country_name";

//ISO country code
static NSString *AftershipCountryCodeABW = @"ABW";
static NSString *AftershipCountryCodeAFG = @"AFG";
static NSString *AftershipCountryCodeAGO = @"AGO";
static NSString *AftershipCountryCodeAIA = @"AIA";
static NSString *AftershipCountryCodeALA = @"ALA";
static NSString *AftershipCountryCodeALB = @"ALB";
static NSString *AftershipCountryCodeAND = @"AND";
static NSString *AftershipCountryCodeARE = @"ARE";
static NSString *AftershipCountryCodeARG = @"ARG";
static NSString *AftershipCountryCodeARM = @"ARM";
static NSString *AftershipCountryCodeASM = @"ASM";
static NSString *AftershipCountryCodeATA = @"ATA";
static NSString *AftershipCountryCodeATF = @"ATF";
static NSString *AftershipCountryCodeATG = @"ATG";
static NSString *AftershipCountryCodeAUS = @"AUS";
static NSString *AftershipCountryCodeAUT = @"AUT";
static NSString *AftershipCountryCodeAZE = @"AZE";
static NSString *AftershipCountryCodeBDI = @"BDI";
static NSString *AftershipCountryCodeBEL = @"BEL";
static NSString *AftershipCountryCodeBEN = @"BEN";
static NSString *AftershipCountryCodeBES = @"BES";
static NSString *AftershipCountryCodeBFA = @"BFA";
static NSString *AftershipCountryCodeBGD = @"BGD";
static NSString *AftershipCountryCodeBGR = @"BGR";
static NSString *AftershipCountryCodeBHR = @"BHR";
static NSString *AftershipCountryCodeBHS = @"BHS";
static NSString *AftershipCountryCodeBIH = @"BIH";
static NSString *AftershipCountryCodeBLM = @"BLM";
static NSString *AftershipCountryCodeBLR = @"BLR";
static NSString *AftershipCountryCodeBLZ = @"BLZ";
static NSString *AftershipCountryCodeBMU = @"BMU";
static NSString *AftershipCountryCodeBOL = @"BOL";
static NSString *AftershipCountryCodeBRA = @"BRA";
static NSString *AftershipCountryCodeBRB = @"BRB";
static NSString *AftershipCountryCodeBRN = @"BRN";
static NSString *AftershipCountryCodeBTN = @"BTN";
static NSString *AftershipCountryCodeBVT = @"BVT";
static NSString *AftershipCountryCodeBWA = @"BWA";
static NSString *AftershipCountryCodeCAF = @"CAF";
static NSString *AftershipCountryCodeCAN = @"CAN";
static NSString *AftershipCountryCodeCCK = @"CCK";
static NSString *AftershipCountryCodeCHE = @"CHE";
static NSString *AftershipCountryCodeCHL = @"CHL";
static NSString *AftershipCountryCodeCHN = @"CHN";
static NSString *AftershipCountryCodeCIV = @"CIV";
static NSString *AftershipCountryCodeCMR = @"CMR";
static NSString *AftershipCountryCodeCOD = @"COD";
static NSString *AftershipCountryCodeCOG = @"COG";
static NSString *AftershipCountryCodeCOK = @"COK";
static NSString *AftershipCountryCodeCOL = @"COL";
static NSString *AftershipCountryCodeCOM = @"COM";
static NSString *AftershipCountryCodeCPV = @"CPV";
static NSString *AftershipCountryCodeCRI = @"CRI";
static NSString *AftershipCountryCodeCUB = @"CUB";
static NSString *AftershipCountryCodeCUW = @"CUW";
static NSString *AftershipCountryCodeCXR = @"CXR";
static NSString *AftershipCountryCodeCYM = @"CYM";
static NSString *AftershipCountryCodeCYP = @"CYP";
static NSString *AftershipCountryCodeCZE = @"CZE";
static NSString *AftershipCountryCodeDEU = @"DEU";
static NSString *AftershipCountryCodeDJI = @"DJI";
static NSString *AftershipCountryCodeDMA = @"DMA";
static NSString *AftershipCountryCodeDNK = @"DNK";
static NSString *AftershipCountryCodeDOM = @"DOM";
static NSString *AftershipCountryCodeDZA = @"DZA";
static NSString *AftershipCountryCodeECU = @"ECU";
static NSString *AftershipCountryCodeEGY = @"EGY";
static NSString *AftershipCountryCodeERI = @"ERI";
static NSString *AftershipCountryCodeESH = @"ESH";
static NSString *AftershipCountryCodeESP = @"ESP";
static NSString *AftershipCountryCodeEST = @"EST";
static NSString *AftershipCountryCodeETH = @"ETH";
static NSString *AftershipCountryCodeFIN = @"FIN";
static NSString *AftershipCountryCodeFJI = @"FJI";
static NSString *AftershipCountryCodeFLK = @"FLK";
static NSString *AftershipCountryCodeFRA = @"FRA";
static NSString *AftershipCountryCodeFRO = @"FRO";
static NSString *AftershipCountryCodeFSM = @"FSM";
static NSString *AftershipCountryCodeGAB = @"GAB";
static NSString *AftershipCountryCodeGBR = @"GBR";
static NSString *AftershipCountryCodeGEO = @"GEO";
static NSString *AftershipCountryCodeGGY = @"GGY";
static NSString *AftershipCountryCodeGHA = @"GHA";
static NSString *AftershipCountryCodeGIB = @"GIB";
static NSString *AftershipCountryCodeGIN = @"GIN";
static NSString *AftershipCountryCodeGLP = @"GLP";
static NSString *AftershipCountryCodeGMB = @"GMB";
static NSString *AftershipCountryCodeGNB = @"GNB";
static NSString *AftershipCountryCodeGNQ = @"GNQ";
static NSString *AftershipCountryCodeGRC = @"GRC";
static NSString *AftershipCountryCodeGRD = @"GRD";
static NSString *AftershipCountryCodeGRL = @"GRL";
static NSString *AftershipCountryCodeGTM = @"GTM";
static NSString *AftershipCountryCodeGUF = @"GUF";
static NSString *AftershipCountryCodeGUM = @"GUM";
static NSString *AftershipCountryCodeGUY = @"GUY";
static NSString *AftershipCountryCodeHKG = @"HKG";
static NSString *AftershipCountryCodeHMD = @"HMD";
static NSString *AftershipCountryCodeHND = @"HND";
static NSString *AftershipCountryCodeHRV = @"HRV";
static NSString *AftershipCountryCodeHTI = @"HTI";
static NSString *AftershipCountryCodeHUN = @"HUN";
static NSString *AftershipCountryCodeIDN = @"IDN";
static NSString *AftershipCountryCodeIMN = @"IMN";
static NSString *AftershipCountryCodeIND = @"IND";
static NSString *AftershipCountryCodeIOT = @"IOT";
static NSString *AftershipCountryCodeIRL = @"IRL";
static NSString *AftershipCountryCodeIRN = @"IRN";
static NSString *AftershipCountryCodeIRQ = @"IRQ";
static NSString *AftershipCountryCodeISL = @"ISL";
static NSString *AftershipCountryCodeISR = @"ISR";
static NSString *AftershipCountryCodeITA = @"ITA";
static NSString *AftershipCountryCodeJAM = @"JAM";
static NSString *AftershipCountryCodeJEY = @"JEY";
static NSString *AftershipCountryCodeJOR = @"JOR";
static NSString *AftershipCountryCodeJPN = @"JPN";
static NSString *AftershipCountryCodeKAZ = @"KAZ";
static NSString *AftershipCountryCodeKEN = @"KEN";
static NSString *AftershipCountryCodeKGZ = @"KGZ";
static NSString *AftershipCountryCodeKHM = @"KHM";
static NSString *AftershipCountryCodeKIR = @"KIR";
static NSString *AftershipCountryCodeKNA = @"KNA";
static NSString *AftershipCountryCodeKOR = @"KOR";
static NSString *AftershipCountryCodeKWT = @"KWT";
static NSString *AftershipCountryCodeLAO = @"LAO";
static NSString *AftershipCountryCodeLBN = @"LBN";
static NSString *AftershipCountryCodeLBR = @"LBR";
static NSString *AftershipCountryCodeLBY = @"LBY";
static NSString *AftershipCountryCodeLCA = @"LCA";
static NSString *AftershipCountryCodeLIE = @"LIE";
static NSString *AftershipCountryCodeLKA = @"LKA";
static NSString *AftershipCountryCodeLSO = @"LSO";
static NSString *AftershipCountryCodeLTU = @"LTU";
static NSString *AftershipCountryCodeLUX = @"LUX";
static NSString *AftershipCountryCodeLVA = @"LVA";
static NSString *AftershipCountryCodeMAC = @"MAC";
static NSString *AftershipCountryCodeMAF = @"MAF";
static NSString *AftershipCountryCodeMAR = @"MAR";
static NSString *AftershipCountryCodeMCO = @"MCO";
static NSString *AftershipCountryCodeMDA = @"MDA";
static NSString *AftershipCountryCodeMDG = @"MDG";
static NSString *AftershipCountryCodeMDV = @"MDV";
static NSString *AftershipCountryCodeMEX = @"MEX";
static NSString *AftershipCountryCodeMHL = @"MHL";
static NSString *AftershipCountryCodeMKD = @"MKD";
static NSString *AftershipCountryCodeMLI = @"MLI";
static NSString *AftershipCountryCodeMLT = @"MLT";
static NSString *AftershipCountryCodeMMR = @"MMR";
static NSString *AftershipCountryCodeMNE = @"MNE";
static NSString *AftershipCountryCodeMNG = @"MNG";
static NSString *AftershipCountryCodeMNP = @"MNP";
static NSString *AftershipCountryCodeMOZ = @"MOZ";
static NSString *AftershipCountryCodeMRT = @"MRT";
static NSString *AftershipCountryCodeMSR = @"MSR";
static NSString *AftershipCountryCodeMTQ = @"MTQ";
static NSString *AftershipCountryCodeMUS = @"MUS";
static NSString *AftershipCountryCodeMWI = @"MWI";
static NSString *AftershipCountryCodeMYS = @"MYS";
static NSString *AftershipCountryCodeMYT = @"MYT";
static NSString *AftershipCountryCodeNAM = @"NAM";
static NSString *AftershipCountryCodeNCL = @"NCL";
static NSString *AftershipCountryCodeNER = @"NER";
static NSString *AftershipCountryCodeNFK = @"NFK";
static NSString *AftershipCountryCodeNGA = @"NGA";
static NSString *AftershipCountryCodeNIC = @"NIC";
static NSString *AftershipCountryCodeNIU = @"NIU";
static NSString *AftershipCountryCodeNLD = @"NLD";
static NSString *AftershipCountryCodeNOR = @"NOR";
static NSString *AftershipCountryCodeNPL = @"NPL";
static NSString *AftershipCountryCodeNRU = @"NRU";
static NSString *AftershipCountryCodeNZL = @"NZL";
static NSString *AftershipCountryCodeOMN = @"OMN";
static NSString *AftershipCountryCodePAK = @"PAK";
static NSString *AftershipCountryCodePAN = @"PAN";
static NSString *AftershipCountryCodePCN = @"PCN";
static NSString *AftershipCountryCodePER = @"PER";
static NSString *AftershipCountryCodePHL = @"PHL";
static NSString *AftershipCountryCodePLW = @"PLW";
static NSString *AftershipCountryCodePNG = @"PNG";
static NSString *AftershipCountryCodePOL = @"POL";
static NSString *AftershipCountryCodePRI = @"PRI";
static NSString *AftershipCountryCodePRK = @"PRK";
static NSString *AftershipCountryCodePRT = @"PRT";
static NSString *AftershipCountryCodePRY = @"PRY";
static NSString *AftershipCountryCodePSE = @"PSE";
static NSString *AftershipCountryCodePYF = @"PYF";
static NSString *AftershipCountryCodeQAT = @"QAT";
static NSString *AftershipCountryCodeREU = @"REU";
static NSString *AftershipCountryCodeROU = @"ROU";
static NSString *AftershipCountryCodeRUS = @"RUS";
static NSString *AftershipCountryCodeRWA = @"RWA";
static NSString *AftershipCountryCodeSAU = @"SAU";
static NSString *AftershipCountryCodeSDN = @"SDN";
static NSString *AftershipCountryCodeSEN = @"SEN";
static NSString *AftershipCountryCodeSGP = @"SGP";
static NSString *AftershipCountryCodeSGS = @"SGS";
static NSString *AftershipCountryCodeSHN = @"SHN";
static NSString *AftershipCountryCodeSJM = @"SJM";
static NSString *AftershipCountryCodeSLB = @"SLB";
static NSString *AftershipCountryCodeSLE = @"SLE";
static NSString *AftershipCountryCodeSLV = @"SLV";
static NSString *AftershipCountryCodeSMR = @"SMR";
static NSString *AftershipCountryCodeSOM = @"SOM";
static NSString *AftershipCountryCodeSPM = @"SPM";
static NSString *AftershipCountryCodeSRB = @"SRB";
static NSString *AftershipCountryCodeSSD = @"SSD";
static NSString *AftershipCountryCodeSTP = @"STP";
static NSString *AftershipCountryCodeSUR = @"SUR";
static NSString *AftershipCountryCodeSVK = @"SVK";
static NSString *AftershipCountryCodeSVN = @"SVN";
static NSString *AftershipCountryCodeSWE = @"SWE";
static NSString *AftershipCountryCodeSWZ = @"SWZ";
static NSString *AftershipCountryCodeSXM = @"SXM";
static NSString *AftershipCountryCodeSYC = @"SYC";
static NSString *AftershipCountryCodeSYR = @"SYR";
static NSString *AftershipCountryCodeTCA = @"TCA";
static NSString *AftershipCountryCodeTCD = @"TCD";
static NSString *AftershipCountryCodeTGO = @"TGO";
static NSString *AftershipCountryCodeTHA = @"THA";
static NSString *AftershipCountryCodeTJK = @"TJK";
static NSString *AftershipCountryCodeTKL = @"TKL";
static NSString *AftershipCountryCodeTKM = @"TKM";
static NSString *AftershipCountryCodeTLS = @"TLS";
static NSString *AftershipCountryCodeTON = @"TON";
static NSString *AftershipCountryCodeTTO = @"TTO";
static NSString *AftershipCountryCodeTUN = @"TUN";
static NSString *AftershipCountryCodeTUR = @"TUR";
static NSString *AftershipCountryCodeTUV = @"TUV";
static NSString *AftershipCountryCodeTWN = @"TWN";
static NSString *AftershipCountryCodeTZA = @"TZA";
static NSString *AftershipCountryCodeUGA = @"UGA";
static NSString *AftershipCountryCodeUKR = @"UKR";
static NSString *AftershipCountryCodeUMI = @"UMI";
static NSString *AftershipCountryCodeURY = @"URY";
static NSString *AftershipCountryCodeUSA = @"USA";
static NSString *AftershipCountryCodeUZB = @"UZB";
static NSString *AftershipCountryCodeVAT = @"VAT";
static NSString *AftershipCountryCodeVCT = @"VCT";
static NSString *AftershipCountryCodeVEN = @"VEN";
static NSString *AftershipCountryCodeVGB = @"VGB";
static NSString *AftershipCountryCodeVIR = @"VIR";
static NSString *AftershipCountryCodeVNM = @"VNM";
static NSString *AftershipCountryCodeVUT = @"VUT";
static NSString *AftershipCountryCodeWLF = @"WLF";
static NSString *AftershipCountryCodeWSM = @"WSM";
static NSString *AftershipCountryCodeYEM = @"YEM";
static NSString *AftershipCountryCodeZAF = @"ZAF";
static NSString *AftershipCountryCodeZMB = @"ZMB";
static NSString *AftershipCountryCodeZWE = @"ZWE";
