Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42A757E68AF
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Nov 2023 11:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbjKIKtR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Nov 2023 05:49:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjKIKtQ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Nov 2023 05:49:16 -0500
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2053.outbound.protection.outlook.com [40.107.9.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330A22696;
        Thu,  9 Nov 2023 02:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZ7uSBK7ZwE979jzB3fK8op36DePZ8X1E7bE9ApxJvN+iaWyX+PVHjh8Z6EX4Kg1vGrBLFrcusZlABzR7KaUGEzazz11ECS8kXCfEB++DdlQSYxBEsO6JnqIwK99k3kXI6OeiGYnbnD6/rQzol1eA+yckTewP7p1yDjax6eod2JC6/jW4v5f3Ko8rHpLmp4p65mb30JKUC5nyoEP5dOhGvdMQ/k+AlHmx5FFJFqTEB9wMGNUOQICU9ebH1zkv8Fn7PeuGYEx2LBO+MU8y1F+YLxwD6sYX1PmR6DOzf0u/UXeXzMDCfYUIwsvdRhs3hF51mkjiyqzxVFwdTsNpMfPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZeEr09GfIpEasVIGUYzEoTn1k0DFHr19PyFskwYXn0=;
 b=c7KoivpAmShRI8FvMWucqnT8wOoNtDpi8xDxmZg8icUGAg0yjjmYCkR5/c15if5bxR/YhyATRXNJguOLhSu2F/PymVP46JBateXl7UlLueT9fK+u3IGymRMrxsjS2wfGhKd+pZBiRqkCbXRMnnDl0LCO4MiZ2V0IPrPnhRORYghxhtSidP2JJUE1Ca1sqpic1qnaKIXiczKRmyA4oj6b2A2rfoRHd9e3CTXxmTaMeFlcOon1M7Py/P6GgzS9p8UKHE1sS94IBEBS2Zc8MfaJ3C4B33ntTFB6OgNL/G4/RcXIRKxC6dRCsdmsOeaRoBZ9aLPbdaiSP2hejDOCrM8M6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZeEr09GfIpEasVIGUYzEoTn1k0DFHr19PyFskwYXn0=;
 b=kPVSqhGW8bi6mrkD6KvADo2Crn+67Zxsx5Ji7uZXts1vdFIRsfJgcl7zGlGyPGIoTcQODgGOIlrJHblMzQkLoHNz9fGy2C2SOwxetmBvVpkCDMjdqFsimBWgDN6o4Qyoy7rt2EfgserZhXz1sxHZ0u+I0gg1oFZIr4jKJTpfwG3RPW7XkWwlBQKxW61HGBoQ9hIRu9Hla1RVds4jmoi5PQH1mE1s+55P6eou6zqi7czdEriphwWB7SXGyQQUM7m7IRZWmmXbJTYi8eKodn3sKchBnDo2QKBjUcTxe5SoxiJGe5iX9BuMj+T7PmhqdLMzDWjE76DG6eAo0kQlbgKfIA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1969.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Thu, 9 Nov
 2023 10:49:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7002.007; Thu, 9 Nov 2023
 10:49:05 +0000
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
CC:     Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        guoren <guoren@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Geoff Levand <geoff@infradead.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "x86@kernel.org" <x86@kernel.org>, Helge Deller <deller@gmx.de>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Timur Tabi <timur@kernel.org>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        David Woodhouse <dwmw2@infradead.org>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-trace-kernel@vger.kernel.org" 
        <linux-trace-kernel@vger.kernel.org>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
Thread-Topic: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
Thread-Index: AQHaEkPkiwEWo83izEmVhjzNZW4UOLBwvvwAgAASbACAAPZYAIAACG2A
Date:   Thu, 9 Nov 2023 10:49:05 +0000
Message-ID: <886df4e4-9fc2-ca52-e7e9-53688e6e821a@csgroup.eu>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
 <ecedb0f1-9543-35c6-18bd-723e6bf21173@csgroup.eu>
 <d94de5b8-db92-4055-9484-f2666973c02a@app.fastmail.com>
 <87o7g3qlf5.fsf@mail.lhotse>
In-Reply-To: <87o7g3qlf5.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1969:EE_
x-ms-office365-filtering-correlation-id: ac1fda33-9198-4fc0-64f7-08dbe1117e45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rzF1s3u6I6xSWkqcjCUYWmstHyEG6eNcLOVsNAY+YGNLl8sdpdanCbuzNPx81RakqvZ0mP8ZbuREeQOVibBAeHNdHW5jusghFCeooT+BBckFnP6QakRSvU+WWcKGGGD6/7Mw3YhlDJiMFLEQbtAb2sRKGkOg8eLqP4Hekl+E+2VvqpnRY+gPX2vt+EbV8aCL+G6RCqdSKR8KJbjWdePyPBukRF+AfUZ4kBu9PE48MUT1VyNwJ5s3oOSxekDGSR9S8dVSSw7ySqElO5+utoSgoICgyW4Uj5fNSgFn0aGJYRDjnDNaRjyYxHv19+Vb8aPW6hjqLnXqVEu7ipmcfYPGrshBvaOgy6nMdYop1BUYjJjk1VbSY7Ci76pgJwUo5+XKGSrmXbmFbJHeEst0NbBLl3Afo8H0aV3FZ1dGvkapT3zI4f4QHI6H4lBQGVwQ3lMXogWAzXjpXwU2+LvvrY5C7D2MAScSZbG2HQ1U9ARbWh/qvFZz6nSj0bH8jzSTwwrWDbSKbx59amVq1M7VxlpDbVXUtKxGmPMpaJemOMUcI23KkEiekLnOXkGAKtuMxbCqTpQ/GdXzjv/GCsSIW5YxT33Ox967zaBHOvQ7s1wYh2FZnLyuug+Xqhst+fPuBjnhw6vNvpNly9VyPtVzE+KsXUjVAgePKCjRMQ3SpCTnxLk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(26005)(6506007)(71200400001)(2616005)(6512007)(7406005)(83380400001)(44832011)(41300700001)(8936002)(5660300002)(8676002)(4326008)(7416002)(7366002)(966005)(6486002)(2906002)(478600001)(316002)(91956017)(110136005)(54906003)(66476007)(66946007)(66446008)(66556008)(64756008)(76116006)(86362001)(122000001)(38100700002)(31696002)(36756003)(38070700009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTVSbWNYZ0dibC9WMXRlc2QyN0pWbDhIcjF5RHVnTkpjbEM3TFA3NzdQWXkr?=
 =?utf-8?B?WkwyODJyU01hUWdRTVVEakNJWWlzVXJRaS9UV1IrbWc5aHloaUxkVTd2NFRX?=
 =?utf-8?B?TXJVSExWbWl2UUY5dmZqejJTa3RPYlBuSm55Q1JaTFgvdlVRaldjZ2ZjNGVY?=
 =?utf-8?B?ZFhmVEQ2ODl2cUdmdmF6WXJ6cmJWNDBNeHhBKy9jeE0xdk5YYkkrS2lzVHJs?=
 =?utf-8?B?TEI1VGErYlRJeUxnWUNoemtPVG5ORjAyNCtmWGN2ZStCdnE5bmhleHh2RzhY?=
 =?utf-8?B?VFBoK1FmcExFeDlGWlhyLzBBcUg5Z3B0Y1JmendWVlpvak1HeEZRaTk0ZWx1?=
 =?utf-8?B?QjkzMGtZQ0Q0YmYra0pKWWExdisrVGVLMUNWMzZ5d0hjTndHMU85RFA3eVdG?=
 =?utf-8?B?a3NIQXd2cUpDc2VTSDdzRk15WG5wZFZiSVV4SEl0dk04NDFSVlQ5ZU8xbExR?=
 =?utf-8?B?alo3UmNqWFZQWHMvSE9YWEZHY2F4QVkxQjVOUitaU3hqWnl3T0RHUS9QZlho?=
 =?utf-8?B?RjZlUDY1Wk5MTXNzVXVMTG1LSjRYeU0zUWZ2cEZoSXUxWXp5dEtkT3czcUFp?=
 =?utf-8?B?c2hpaGoyVkVTbnNZUXdzRS81bXRRem5PSmNmSWovc0RWbVYvTXN0emZva28v?=
 =?utf-8?B?ZUZoaXZqL1hOZGpjd0J3ZEI0STA0MFphR2luUjUzTjhOaEdOVGF5VlFYbVVO?=
 =?utf-8?B?dFRmRGRMYjNDL0dJYXQxRUhiT2V2RDF2cU9NQ3BCZkkyN1lqOURFT0JURkpu?=
 =?utf-8?B?UEtKdnZQU3J0YVAyOWtSZEpHUER6MWVQK0RqbnNnSE9POFlHZG0vV0FOcFFr?=
 =?utf-8?B?YmZYZXlvZ3d0UUFEN0pqY0JaODZ4d1gxZGQrUWtRd3p3dVFqSTFWWmdOT3Za?=
 =?utf-8?B?MXYyY0RSMnFTTkFZT2RiNjZRZmhSbHgxUk1mUy8yZ3hKZWNhQW9FYXdyRDdC?=
 =?utf-8?B?WU8xNFBVRzU0WEkyWXNHVDhsdFlsT3dhQlY2WHRvSnAvQm1vaVpsRElBM2dX?=
 =?utf-8?B?NUp1UEJxaUt2ZzdiSFVHQ2F6Nmd1U2trWGFXRU1rdjZNcHF3UmpjSjR0WitS?=
 =?utf-8?B?Vi9FTDhsMWhyQXYrNjdrQkFRTTJORHdZOHZrZVdJQkM4dE5MMmFyTUZSczVU?=
 =?utf-8?B?RUxXTDE5aW8rTzBWZHkxRndlZVN3QVpxUlVhVllOdWJETFRFSysyLzZRMUxV?=
 =?utf-8?B?OEFaMUZaOUxSSzZtNU41S0l5Y1RveHhneTRLblhrRnZPTkg5LzZtK0FVZ2wy?=
 =?utf-8?B?UGVwcWJ3a3hpRGppSk00eGl1aVpGcUt5YkNHdDdJVGh5T2xyN2VDNVpRV1pj?=
 =?utf-8?B?N1dMM2Y3SWVIWHo1Z0dmekFUUVVVSlZ6QlBLMHNUQmtIWXMwdUFkMlpIMWd4?=
 =?utf-8?B?UUJvN3NZU1kzYm1NZVlJTkpxbTR2YXRCQjJHWWREOU11SE9NV1lnTzhCRGh0?=
 =?utf-8?B?eGJISmVDYS8ydnpJQlo0VlF2OHB6TGpEemRPdVppbkZWNmx0emQ1d3kwVmkx?=
 =?utf-8?B?blFKWm5sZkN5alFRbGNoKzlyaHJwb1FMeGxtQ25hNFVzcExuUXpib0FNN2tV?=
 =?utf-8?B?L2tvSktRYURZby9GbW5yTWdnQ2VLekxQb1N0OEkwY1ZpU1NJOWVUN1lubkhT?=
 =?utf-8?B?TmhxcFp4YzRuenpnaFh0VkIwNzZMYkdJcHUvVVM2UXNQcUVOY1laMERPbzdB?=
 =?utf-8?B?M3QvOWtJVktSazMyVnVha3RhTVdzU1A5WFlIdW9jRm8vR1JVa3d5TDU1b3FR?=
 =?utf-8?B?Z0kxNUoxVVRMeXdxZE92OXREaU51K0Z0dlNhVWt1RWtyTmZoVEJ6eldTa1ho?=
 =?utf-8?B?Und0SElyUHNUSy9RYUtQTTMzclBDRUNzMFViRVVZa1NTZzd2cnljZ3BDRzJ4?=
 =?utf-8?B?QU5HeHVGeG4vQ1pMMS8wODY2ZG5xcGtVQU5kcUVhOWY5ZzNVejhaMXFDenVh?=
 =?utf-8?B?dVBqRWJCSGRib3V5MlNwTnQyUzgyRVZScnRVbGxoWWFaYjVKWWkxakRQWVE5?=
 =?utf-8?B?cnRrV0ltS1kwWlhCS05TTVdGMjZEM2JuMTREcURiaEw3aXQvRU43d1BWTzYz?=
 =?utf-8?B?dytnTFg0Qkc0b1MzeVNlOTZrSHdvaUpucDRaMFdyWmh2aVdMeWtxV0c3am1N?=
 =?utf-8?B?amVaNFk5YzZYb0dORUdLM1NPMVl2NUp0TVBXVEFDZm1PV2twa0Fad2lPTnF3?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46B1EF2D4572EA4EA79E2124E418290F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1fda33-9198-4fc0-64f7-08dbe1117e45
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 10:49:05.1707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: efi3su8U19IpISCtzqcsjICNgjz75G9Tly+DZj0APujcF6WpcmoiZF5LxSkKOGbeIlECstL7kjafJArBSDBELmA5O7g65q5wc7HL2lNnxJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1969
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

DQoNCkxlIDA5LzExLzIwMjMgw6AgMTE6MTgsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gIkFybmQgQmVyZ21hbm4iIDxhcm5kQGFybmRiLmRlPiB3cml0ZXM6DQo+PiBPbiBXZWQsIE5v
diA4LCAyMDIzLCBhdCAxOTozMSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+PiBMZSAwOC8x
MS8yMDIzIMOgIDEzOjU4LCBBcm5kIEJlcmdtYW5uIGEgw6ljcml0wqA6DQo+Pg0KPj4+IHBvd2Vy
cGMgaGFzIGZ1bmN0aW9ucyBkb2luZyBtb3JlIG9yIGxlc3MgdGhlIHNhbWUsIHRoZXkgYXJlIGNh
bGxlZA0KPj4+IF9fY19rZXJuZWxfY2xvY2tfZ2V0dGltZSgpIGFuZCBhbGlrZSB3aXRoIHRoZWly
IHByb3RvdHlwZXMgc2l0aW5nIGluDQo+Pj4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Zkc28v
Z2V0dGltZW9mZGF5LmgNCj4+Pg0KPj4+IFNob3VsZCB0aG9zZSBwcm90b3R5cGVzIGJlIG1vdmVk
IHRvIGluY2x1ZGUvdmRzby9nZXR0aW1lLmggdG9vIGFuZA0KPj4+IGV2ZW50dWFsbHkgcmVuYW1l
ZCwgb3IgYXJlIHRoZXkgY29uc2lkZXJlZCB0b28gcG93ZXJwYyBzcGVjaWZpYyA/DQo+Pg0KPj4g
SSBkb24ndCBhY3R1YWxseSBrbm93LCBteSBpbml0aWFsIGludGVycHJldGF0aW9uIHdhcyB0aGF0
DQo+PiB0aGVzZSBmdW5jdGlvbiBuYW1lcyBhcmUgcGFydCBvZiB0aGUgdXNlciBBQkkgZm9yIHRo
ZSB2ZHNvLA0KPj4gYnV0IEkgbmV2ZXIgbG9va2VkIGNsb3NlbHkgZW5vdWdoIGF0IGhvdyB2ZHNv
IHdvcmtzIHRvDQo+PiBiZSBzdXJlIHdoYXQgdGhlIGFjdHVhbCBBQkkgaXMuDQo+IA0KPiBBRkFJ
SyB0aGUgQUJJIGlzIGp1c3QgdGhlIHN5bWJvbHMgd2UgZXhwb3J0LCBhcyBkZWZpbmVkIGluIHRo
ZSBsaW5rZXINCj4gc2NyaXB0Og0KPiANCj4gLyoNCj4gICAqIFRoaXMgY29udHJvbHMgd2hhdCBz
eW1ib2xzIHdlIGV4cG9ydCBmcm9tIHRoZSBEU08uDQo+ICAgKi8NCj4gVkVSU0lPTg0KPiB7DQo+
IAlWRFNPX1ZFUlNJT05fU1RSSU5HIHsNCj4gCWdsb2JhbDoNCj4gCQlfX2tlcm5lbF9nZXRfc3lz
Y2FsbF9tYXA7DQo+IAkJX19rZXJuZWxfZ2V0dGltZW9mZGF5Ow0KPiAJCV9fa2VybmVsX2Nsb2Nr
X2dldHRpbWU7DQo+IAkJX19rZXJuZWxfY2xvY2tfZ2V0cmVzOw0KPiAJCV9fa2VybmVsX2dldF90
YmZyZXE7DQo+IAkJX19rZXJuZWxfc3luY19kaWNhY2hlOw0KPiAJCV9fa2VybmVsX3NpZ3RyYW1w
X3J0NjQ7DQo+IAkJX19rZXJuZWxfZ2V0Y3B1Ow0KPiAJCV9fa2VybmVsX3RpbWU7DQo+IA0KPiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vdmRzbzY0Lmxkcy5TP2g9djYu
NiYjbjExNw0KPiANCj4+IElmIF9fY19rZXJuZWxfY2xvY2tfZ2V0dGltZSgpIGV0YyBhcmUgbm90
IHBhcnQgb2YgdGhlIHVzZXItZmFjaW5nDQo+PiBBQkksIEkgdGhpbmsgcmVuYW1pbmcgdGhlbSBm
b3IgY29uc2lzdGVuY3kgd2l0aCB0aGUgb3RoZXINCj4+IGFyY2hpdGVjdHVyZXMgd291bGQgYmUg
YmVzdC4NCj4gDQo+IFRoZSBfX2Mgc3ltYm9scyBhcmUgbm90IHBhcnQgb2YgdGhlIEFCSSwgc28g
d2UgY291bGQgcmVuYW1lIHRoZW0uDQo+IA0KPiBBdCB0aGUgbW9tZW50IHRob3VnaCB0aGV5IGRv
bid0IGhhdmUgdGhlIHNhbWUgcHJvdG90eXBlIGFzIHRoZSBnZW5lcmljDQo+IHZlcnNpb25zLCBi
ZWNhdXNlIHdlIGZpbmQgdGhlIFZEU08gZGF0YSBpbiBhc20gYW5kIHBhc3MgaXQgdG8gdGhlIEMN
Cj4gZnVuY3Rpb25zLCBlZzoNCj4gDQo+IGludCBfX2Nfa2VybmVsX2dldHRpbWVvZmRheShzdHJ1
Y3QgX19rZXJuZWxfb2xkX3RpbWV2YWwgKnR2LCBzdHJ1Y3QgdGltZXpvbmUgKnR6LA0KPiAJCQkg
ICAgY29uc3Qgc3RydWN0IHZkc29fZGF0YSAqdmQpOw0KPiANCj4gSSB0aGluayB3ZSBjYW4gcmV3
b3JrIHRoYXQgdGhvdWdoLCBieSBpbXBsZW1lbnRpbmcNCj4gX19hcmNoX2dldF92ZHNvX2RhdGEo
KSBhbmQgZ2V0dGluZyB0aGUgdmRzb19kYXRhIGluIEMuIFRoZW4gd2UnZCBiZSBhYmxlDQo+IHRv
IHNoYXJlIHRoZSBwcm90b3R5cGVzLg0KDQpJIHRoaW5rIGl0IHdvdWxkIG5vdCBhIGJlZW4gZ29v
ZCBpZGVhLCBpdCB3b3VsZCBiZSBsZXNzIHBlcmZvcm1hbnQsIGZvciANCmV4cGxhbmF0aW9uIHNl
ZSBjb21taXQgDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD1lODc2ZjBiNjlkYzk5M2U4NmNhNzc5NWU2
M2U5ODM4NWFhOWE3ZWYzDQoNCkNocmlzdG9waGUNCg==
