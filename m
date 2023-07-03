Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04F127455A8
	for <lists+linux-fbdev@lfdr.de>; Mon,  3 Jul 2023 08:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjGCGxe (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 3 Jul 2023 02:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjGCGx1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 3 Jul 2023 02:53:27 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E371DD;
        Sun,  2 Jul 2023 23:53:24 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 876AF218E5;
        Mon,  3 Jul 2023 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1688367203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=k47v4CO90EEqIshC+rQiqkbrxzkEATD9KOfHaH4P9LM=;
        b=AH2b2ztj8kJr1FF4KTZpVGB72AD6h77eqYoTNr5pANyIqi4zu+nEkh4luq2+qnZwoINjMz
        x9UfjNXErLw0GVivrUZqdiQi+6pNO30m4mSkP9jrdEeX/QKuFDgcpTCKjImK16WRWZ/0Xn
        YpHiqv2phNKQxbmfh0TBZFgfkR85iPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1688367203;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=k47v4CO90EEqIshC+rQiqkbrxzkEATD9KOfHaH4P9LM=;
        b=badGysFZAQPe0g3HMPpFSw8EgCG4hGWqcIPnBpvYN11QLYHubsv3FCCG5pMcCVaU2GqpBs
        9TSdhhNGZyrIIGCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 248AE13276;
        Mon,  3 Jul 2023 06:53:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 13rsB2NwomRWQgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 03 Jul 2023 06:53:23 +0000
Message-ID: <e83eab26-a8fe-b151-6bd4-7a7db6ceee1f@suse.de>
Date:   Mon, 3 Jul 2023 08:53:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
To:     Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     x86@kernel.org, linux-fbdev@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helge Deller <deller@gmx.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-2-javierm@redhat.com>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230701214503.550549-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sKXktxSX2QeYrt3OBJ9eAnFc"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sKXktxSX2QeYrt3OBJ9eAnFc
Content-Type: multipart/mixed; boundary="------------tblOCBbtXb0tY0N9lUcZgunQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <e83eab26-a8fe-b151-6bd4-7a7db6ceee1f@suse.de>
Subject: Re: [PATCH v2 1/2] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-2-javierm@redhat.com>
In-Reply-To: <20230701214503.550549-2-javierm@redhat.com>

--------------tblOCBbtXb0tY0N9lUcZgunQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDcuMjMgdW0gMjM6NDQgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEN1cnJlbnRseSB0aGUgQ09ORklHX0ZCIG9wdGlvbiBoYXMgdG8gYmUgZW5h
YmxlZCBldmVuIGlmIG5vIGxlZ2FjeSBmYmRldg0KPiBkcml2ZXJzIGFyZSBuZWVkZWQgKGUu
Zzogb25seSB0byBoYXZlIHN1cHBvcnQgZm9yIGZyYW1lYnVmZmVyIGNvbnNvbGVzKS4NCj4g
DQo+IFRoZSBEUk0gc3Vic3lzdGVtIGhhcyBhIGZiZGV2IGVtdWxhdGlvbiBsYXllciwgYnV0
IGRlcGVuZHMgb24gQ09ORklHX0ZCDQo+IGFuZCBzbyBpdCBjYW4gb25seSBiZSBlbmFibGVk
IGlmIHRoYXQgZGVwZW5kZW5jeSBpcyBlbmFibGVkIGFzIHdlbGwuDQo+IA0KPiBUaGF0IG1l
YW5zIGZiZGV2IGRyaXZlcnMgaGF2ZSB0byBiZSBleHBsaWNpdGx5IGRpc2FibGVkIGlmIHVz
ZXJzIHdhbnQgdG8NCj4gZW5hYmxlIENPTkZJR19GQiwgb25seSB0byB1c2UgZmJjb24gYW5k
L29yIHRoZSBEUk0gZmJkZXYgZW11bGF0aW9uIGxheWVyLg0KPiANCj4gVGhpcyBwYXRjaCBp
bnRyb2R1Y2VzIGEgbm9uLXZpc2libGUgQ09ORklHX0ZCX0NPUkUgc3ltYm9sIHRoYXQgY291
bGQgYmUNCj4gZW5hYmxlZCBqdXN0IHRvIGhhdmUgY29yZSBzdXBwb3J0IG5lZWRlZCBmb3Ig
Q09ORklHX0RSTV9GQkRFVl9FTVVMQVRJT04sDQo+IGFsbG93aW5nIENPTkZJR19GQiB0byBi
ZSBkaXNhYmxlZCAoYW5kIGF1dG9tYXRpY2FsbHkgZGlzYWJsaW5nIGFsbCB0aGUNCj4gZmJk
ZXYgZHJpdmVycykuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYy
Og0KPiAtIEtlZXAgImRlcGVuZHMgb24gRkIiIGZvciBGQl9EREMsIEZCX0hFQ1VCQSwgRkJf
U1ZHQUxJQiwgRkJfTUFDTU9ERVMsDQo+ICAgIEZCX0JBQ0tMSUdIVCwgRkJfTU9ERV9IRUxQ
RVJTIGFuZCBGQl9USUxFQkxJVFRJTkcgKEFybmQgQmVyZ21hbm4pLg0KPiAtIERvbid0IGNo
YW5nZSB0aGUgZmIubyBvYmplY3QgbmFtZSAoQXJuZCBCZXJnbWFubikuDQo+IC0gTWFrZSBG
Ql9DT1JFIGEgbm9uLXZpc2libGUgS2NvbmZpZyBzeW1ib2wgaW5zdGVhZCAoVGhvbWFzIFpp
bW1lcm1hbm4pLg0KPiANCj4gICBhcmNoL3g4Ni9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
fCAgMiArLQ0KPiAgIGFyY2gveDg2L3ZpZGVvL01ha2VmaWxlICAgICAgICAgICB8ICAyICst
DQo+ICAgZHJpdmVycy92aWRlby9jb25zb2xlL0tjb25maWcgICAgIHwgIDIgKy0NCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgICAgICAgfCA0MCArKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL01ha2VmaWxl
IHwgIDIgKy0NCj4gICA1IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L01ha2VmaWxlIGIvYXJj
aC94ODYvTWFrZWZpbGUNCj4gaW5kZXggYjM5OTc1OTc3YzAzLi44OWEwMmU2OWJlNWYgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gveDg2L01ha2VmaWxlDQo+ICsrKyBiL2FyY2gveDg2L01ha2Vm
aWxlDQo+IEBAIC0yNTksNyArMjU5LDcgQEAgZHJpdmVycy0kKENPTkZJR19QQ0kpICAgICAg
ICAgICAgKz0gYXJjaC94ODYvcGNpLw0KPiAgICMgc3VzcGVuZCBhbmQgaGliZXJuYXRpb24g
c3VwcG9ydA0KPiAgIGRyaXZlcnMtJChDT05GSUdfUE0pICs9IGFyY2gveDg2L3Bvd2VyLw0K
PiAgIA0KPiAtZHJpdmVycy0kKENPTkZJR19GQikgKz0gYXJjaC94ODYvdmlkZW8vDQo+ICtk
cml2ZXJzLSQoQ09ORklHX0ZCX0NPUkUpICs9IGFyY2gveDg2L3ZpZGVvLw0KPiAgIA0KPiAg
ICMjIyMNCj4gICAjIGJvb3QgbG9hZGVyIHN1cHBvcnQuIFNldmVyYWwgdGFyZ2V0cyBhcmUg
a2VwdCBmb3IgbGVnYWN5IHB1cnBvc2VzDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni92aWRl
by9NYWtlZmlsZSBiL2FyY2gveDg2L3ZpZGVvL01ha2VmaWxlDQo+IGluZGV4IDExNjQwYzEx
NjExNS4uNWViZTQ4NzUyZmZjIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni92aWRlby9NYWtl
ZmlsZQ0KPiArKysgYi9hcmNoL3g4Ni92aWRlby9NYWtlZmlsZQ0KPiBAQCAtMSwyICsxLDIg
QEANCj4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gLW9i
ai0kKENPTkZJR19GQikgICAgICAgICAgICAgICArPSBmYmRldi5vDQo+ICtvYmotJChDT05G
SUdfRkJfQ09SRSkJCSs9IGZiZGV2Lm8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8v
Y29uc29sZS9LY29uZmlnIGIvZHJpdmVycy92aWRlby9jb25zb2xlL0tjb25maWcNCj4gaW5k
ZXggYTJhODhkNDJlZGYwLi4xYjVhMzE5OTcxZWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dmlkZW8vY29uc29sZS9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS9L
Y29uZmlnDQo+IEBAIC03Miw3ICs3Miw3IEBAIGNvbmZpZyBEVU1NWV9DT05TT0xFX1JPV1MN
Cj4gICANCj4gICBjb25maWcgRlJBTUVCVUZGRVJfQ09OU09MRQ0KPiAgIAlib29sICJGcmFt
ZWJ1ZmZlciBDb25zb2xlIHN1cHBvcnQiDQo+IC0JZGVwZW5kcyBvbiBGQiAmJiAhVU1MDQo+
ICsJZGVwZW5kcyBvbiBGQl9DT1JFICYmICFVTUwNCj4gICAJc2VsZWN0IFZUX0hXX0NPTlNP
TEVfQklORElORw0KPiAgIAlzZWxlY3QgQ1JDMzINCj4gICAJc2VsZWN0IEZPTlRfU1VQUE9S
VA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnIGIvZHJpdmVy
cy92aWRlby9mYmRldi9LY29uZmlnDQo+IGluZGV4IGNlY2YxNTQxODYzMi4uZGE2ZjdkNTg4
ZjE3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcNCj4gKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+IEBAIC02LDggKzYsMTIgQEANCj4g
ICBjb25maWcgRkJfTk9USUZZDQo+ICAgCWJvb2wNCj4gICANCj4gK21lbnVjb25maWcgRkJf
Q09SRQ0KPiArCXRyaXN0YXRlICJDb3JlIHN1cHBvcnQgZm9yIGZyYW1lIGJ1ZmZlciBkZXZp
Y2VzIg0KDQpXaXRoIHRoZSB0ZXh0LCB0aGlzIGlzIHZpc2libGU7IGFzIG90aGVycyBub3Rl
ZC4NCg0KPiArDQo+ICAgbWVudWNvbmZpZyBGQg0KPiAtCXRyaXN0YXRlICJTdXBwb3J0IGZv
ciBmcmFtZSBidWZmZXIgZGV2aWNlcyINCj4gKwl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgZnJh
bWUgYnVmZmVyIGRldmljZSBkcml2ZXJzIg0KDQpKdXN0IGtlZXAgdGhlIHRleHQgYXMtaXMu
DQoNCj4gKwlzZWxlY3QgRkJfQ09SRQ0KPiAgIAlzZWxlY3QgRkJfTk9USUZZDQo+ICAgCXNl
bGVjdCBWSURFT19DTURMSU5FDQo+ICAgCWhlbHANCj4gQEAgLTMzLDYgKzM3LDEyIEBAIG1l
bnVjb25maWcgRkINCj4gICAJICA8aHR0cDovL3d3dy5tdW50ZWQub3JnLnVrL3Byb2dyYW1t
aW5nL0ZyYW1lYnVmZmVyLUhPV1RPLTEuMy5odG1sPiBmb3IgbW9yZQ0KPiAgIAkgIGluZm9y
bWF0aW9uLg0KPiAgIA0KPiArCSAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIG5hdGl2ZSBm
cmFtZSBidWZmZXIgZGV2aWNlIChmYmRldikgZHJpdmVycy4NCj4gKw0KPiArCSAgVGhlIERS
TSBzdWJzeXN0ZW0gcHJvdmlkZXMgc3VwcG9ydCBmb3IgZW11bGF0ZWQgZnJhbWUgYnVmZmVy
IGRldmljZXMNCj4gKwkgIG9uIHRvcCBvZiBLTVMgZHJpdmVycywgYnV0IHRoaXMgb3B0aW9u
IGFsbG93cyBsZWdhY3kgZmJkZXYgZHJpdmVycyB0bw0KPiArCSAgYmUgZW5hYmxlZCBhcyB3
ZWxsLg0KPiArDQo+ICAgCSAgU2F5IFkgaGVyZSBhbmQgdG8gdGhlIGRyaXZlciBmb3IgeW91
ciBncmFwaGljcyBib2FyZCBiZWxvdyBpZiB5b3UNCj4gICAJICBhcmUgY29tcGlsaW5nIGEg
a2VybmVsIGZvciBhIG5vbi14ODYgYXJjaGl0ZWN0dXJlLg0KPiAgIA0KPiBAQCAtNDQsNyAr
NTQsNyBAQCBtZW51Y29uZmlnIEZCDQo+ICAgDQo+ICAgY29uZmlnIEZJUk1XQVJFX0VESUQN
Cj4gICAJYm9vbCAiRW5hYmxlIGZpcm13YXJlIEVESUQiDQo+IC0JZGVwZW5kcyBvbiBGQg0K
PiArCWRlcGVuZHMgb24gRkJfQ09SRQ0KPiAgIAloZWxwDQo+ICAgCSAgVGhpcyBlbmFibGVz
IGFjY2VzcyB0byB0aGUgRURJRCB0cmFuc2ZlcnJlZCBmcm9tIHRoZSBmaXJtd2FyZS4NCj4g
ICAJICBPbiB0aGUgaTM4NiwgdGhpcyBpcyBmcm9tIHRoZSBWaWRlbyBCSU9TLiBFbmFibGUg
dGhpcyBpZiBEREMvSTJDDQo+IEBAIC01OSw3ICs2OSw3IEBAIGNvbmZpZyBGSVJNV0FSRV9F
RElEDQo+ICAgDQo+ICAgY29uZmlnIEZCX0RFVklDRQ0KPiAgIAlib29sICJQcm92aWRlIGxl
Z2FjeSAvZGV2L2ZiKiBkZXZpY2UiDQo+IC0JZGVwZW5kcyBvbiBGQg0KPiArCXNlbGVjdCBG
Ql9DT1JFDQoNClRoaXMgc2hvdWxkIGRlcGVuZCBvbiBGQl9DT1JFLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+ICAgCWRlZmF1bHQgeQ0KPiAgIAloZWxwDQo+ICAgCSAgU2F5IFkg
aGVyZSBpZiB5b3Ugd2FudCB0aGUgbGVnYWN5IC9kZXYvZmIqIGRldmljZSBmaWxlIGFuZA0K
PiBAQCAtNzUsNyArODUsNyBAQCBjb25maWcgRkJfRERDDQo+ICAgDQo+ICAgY29uZmlnIEZC
X0NGQl9GSUxMUkVDVA0KPiAgIAl0cmlzdGF0ZQ0KPiAtCWRlcGVuZHMgb24gRkINCj4gKwlk
ZXBlbmRzIG9uIEZCX0NPUkUNCj4gICAJaGVscA0KPiAgIAkgIEluY2x1ZGUgdGhlIGNmYl9m
aWxscmVjdCBmdW5jdGlvbiBmb3IgZ2VuZXJpYyBzb2Z0d2FyZSByZWN0YW5nbGUNCj4gICAJ
ICBmaWxsaW5nLiBUaGlzIGlzIHVzZWQgYnkgZHJpdmVycyB0aGF0IGRvbid0IHByb3ZpZGUg
dGhlaXIgb3duDQo+IEBAIC04Myw3ICs5Myw3IEBAIGNvbmZpZyBGQl9DRkJfRklMTFJFQ1QN
Cj4gICANCj4gICBjb25maWcgRkJfQ0ZCX0NPUFlBUkVBDQo+ICAgCXRyaXN0YXRlDQo+IC0J
ZGVwZW5kcyBvbiBGQg0KPiArCWRlcGVuZHMgb24gRkJfQ09SRQ0KPiAgIAloZWxwDQo+ICAg
CSAgSW5jbHVkZSB0aGUgY2ZiX2NvcHlhcmVhIGZ1bmN0aW9uIGZvciBnZW5lcmljIHNvZnR3
YXJlIGFyZWEgY29weWluZy4NCj4gICAJICBUaGlzIGlzIHVzZWQgYnkgZHJpdmVycyB0aGF0
IGRvbid0IHByb3ZpZGUgdGhlaXIgb3duIChhY2NlbGVyYXRlZCkNCj4gQEAgLTkxLDcgKzEw
MSw3IEBAIGNvbmZpZyBGQl9DRkJfQ09QWUFSRUENCj4gICANCj4gICBjb25maWcgRkJfQ0ZC
X0lNQUdFQkxJVA0KPiAgIAl0cmlzdGF0ZQ0KPiAtCWRlcGVuZHMgb24gRkINCj4gKwlkZXBl
bmRzIG9uIEZCX0NPUkUNCj4gICAJaGVscA0KPiAgIAkgIEluY2x1ZGUgdGhlIGNmYl9pbWFn
ZWJsaXQgZnVuY3Rpb24gZm9yIGdlbmVyaWMgc29mdHdhcmUgaW1hZ2UNCj4gICAJICBibGl0
dGluZy4gVGhpcyBpcyB1c2VkIGJ5IGRyaXZlcnMgdGhhdCBkb24ndCBwcm92aWRlIHRoZWly
IG93bg0KPiBAQCAtOTksNyArMTA5LDcgQEAgY29uZmlnIEZCX0NGQl9JTUFHRUJMSVQNCj4g
ICANCj4gICBjb25maWcgRkJfQ0ZCX1JFVl9QSVhFTFNfSU5fQllURQ0KPiAgIAlib29sDQo+
IC0JZGVwZW5kcyBvbiBGQg0KPiArCWRlcGVuZHMgb24gRkJfQ09SRQ0KPiAgIAloZWxwDQo+
ICAgCSAgQWxsb3cgZ2VuZXJpYyBmcmFtZS1idWZmZXIgZnVuY3Rpb25zIHRvIHdvcmsgb24g
ZGlzcGxheXMgd2l0aCAxLCAyDQo+ICAgCSAgYW5kIDQgYml0cyBwZXIgcGl4ZWwgZGVwdGhz
IHdoaWNoIGhhcyBvcHBvc2l0ZSBvcmRlciBvZiBwaXhlbHMgaW4NCj4gQEAgLTEwNyw3ICsx
MTcsNyBAQCBjb25maWcgRkJfQ0ZCX1JFVl9QSVhFTFNfSU5fQllURQ0KPiAgIA0KPiAgIGNv
bmZpZyBGQl9TWVNfRklMTFJFQ1QNCj4gICAJdHJpc3RhdGUNCj4gLQlkZXBlbmRzIG9uIEZC
DQo+ICsJZGVwZW5kcyBvbiBGQl9DT1JFDQo+ICAgCWhlbHANCj4gICAJICBJbmNsdWRlIHRo
ZSBzeXNfZmlsbHJlY3QgZnVuY3Rpb24gZm9yIGdlbmVyaWMgc29mdHdhcmUgcmVjdGFuZ2xl
DQo+ICAgCSAgZmlsbGluZy4gVGhpcyBpcyB1c2VkIGJ5IGRyaXZlcnMgdGhhdCBkb24ndCBw
cm92aWRlIHRoZWlyIG93bg0KPiBAQCAtMTE1LDcgKzEyNSw3IEBAIGNvbmZpZyBGQl9TWVNf
RklMTFJFQ1QNCj4gICANCj4gICBjb25maWcgRkJfU1lTX0NPUFlBUkVBDQo+ICAgCXRyaXN0
YXRlDQo+IC0JZGVwZW5kcyBvbiBGQg0KPiArCWRlcGVuZHMgb24gRkJfQ09SRQ0KPiAgIAlo
ZWxwDQo+ICAgCSAgSW5jbHVkZSB0aGUgc3lzX2NvcHlhcmVhIGZ1bmN0aW9uIGZvciBnZW5l
cmljIHNvZnR3YXJlIGFyZWEgY29weWluZy4NCj4gICAJICBUaGlzIGlzIHVzZWQgYnkgZHJp
dmVycyB0aGF0IGRvbid0IHByb3ZpZGUgdGhlaXIgb3duIChhY2NlbGVyYXRlZCkNCj4gQEAg
LTEyMyw3ICsxMzMsNyBAQCBjb25maWcgRkJfU1lTX0NPUFlBUkVBDQo+ICAgDQo+ICAgY29u
ZmlnIEZCX1NZU19JTUFHRUJMSVQNCj4gICAJdHJpc3RhdGUNCj4gLQlkZXBlbmRzIG9uIEZC
DQo+ICsJZGVwZW5kcyBvbiBGQl9DT1JFDQo+ICAgCWhlbHANCj4gICAJICBJbmNsdWRlIHRo
ZSBzeXNfaW1hZ2VibGl0IGZ1bmN0aW9uIGZvciBnZW5lcmljIHNvZnR3YXJlIGltYWdlDQo+
ICAgCSAgYmxpdHRpbmcuIFRoaXMgaXMgdXNlZCBieSBkcml2ZXJzIHRoYXQgZG9uJ3QgcHJv
dmlkZSB0aGVpciBvd24NCj4gQEAgLTE2MiwyMiArMTcyLDIyIEBAIGVuZGNob2ljZQ0KPiAg
IA0KPiAgIGNvbmZpZyBGQl9TWVNfRk9QUw0KPiAgIAl0cmlzdGF0ZQ0KPiAtCWRlcGVuZHMg
b24gRkINCj4gKwlkZXBlbmRzIG9uIEZCX0NPUkUNCj4gICANCj4gICBjb25maWcgRkJfREVG
RVJSRURfSU8NCj4gICAJYm9vbA0KPiAtCWRlcGVuZHMgb24gRkINCj4gKwlkZXBlbmRzIG9u
IEZCX0NPUkUNCj4gICANCj4gICBjb25maWcgRkJfSU9fSEVMUEVSUw0KPiAgIAlib29sDQo+
IC0JZGVwZW5kcyBvbiBGQg0KPiArCWRlcGVuZHMgb24gRkJfQ09SRQ0KPiAgIAlzZWxlY3Qg
RkJfQ0ZCX0NPUFlBUkVBDQo+ICAgCXNlbGVjdCBGQl9DRkJfRklMTFJFQ1QNCj4gICAJc2Vs
ZWN0IEZCX0NGQl9JTUFHRUJMSVQNCj4gICANCj4gICBjb25maWcgRkJfU1lTX0hFTFBFUlMN
Cj4gICAJYm9vbA0KPiAtCWRlcGVuZHMgb24gRkINCj4gKwlkZXBlbmRzIG9uIEZCX0NPUkUN
Cj4gICAJc2VsZWN0IEZCX1NZU19DT1BZQVJFQQ0KPiAgIAlzZWxlY3QgRkJfU1lTX0ZJTExS
RUNUDQo+ICAgCXNlbGVjdCBGQl9TWVNfRk9QUw0KPiBAQCAtMTg1LDcgKzE5NSw3IEBAIGNv
bmZpZyBGQl9TWVNfSEVMUEVSUw0KPiAgIA0KPiAgIGNvbmZpZyBGQl9TWVNfSEVMUEVSU19E
RUZFUlJFRA0KPiAgIAlib29sDQo+IC0JZGVwZW5kcyBvbiBGQg0KPiArCWRlcGVuZHMgb24g
RkJfQ09SRQ0KPiAgIAlzZWxlY3QgRkJfREVGRVJSRURfSU8NCj4gICAJc2VsZWN0IEZCX1NZ
U19IRUxQRVJTDQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvTWFrZWZpbGUgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvTWFrZWZpbGUNCj4gaW5k
ZXggOTE1MGJhZmQ5ZTg5Li40YzJlNGEwMjZkMTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvTWFrZWZpbGUNCj4gQEAgLTEsNiArMSw2IEBADQo+ICAgIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KPiAgIG9iai0kKENPTkZJR19GQl9OT1RJRlkpICAgICAg
ICAgICArPSBmYl9ub3RpZnkubw0KPiAtb2JqLSQoQ09ORklHX0ZCKSAgICAgICAgICAgICAg
ICAgICs9IGZiLm8NCj4gK29iai0kKENPTkZJR19GQl9DT1JFKSAgICAgICAgICAgICArPSBm
Yi5vDQo+ICAgZmIteSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDo9IGZiX2JhY2ts
aWdodC5vIFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmJf
aW5mby5vIFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmJt
ZW0ubyBmYm1vbi5vIGZiY21hcC5vIFwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0K
R0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4g
TW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------tblOCBbtXb0tY0N9lUcZgunQ--

--------------sKXktxSX2QeYrt3OBJ9eAnFc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSicGIFAwAAAAAACgkQlh/E3EQov+CN
GxAAt6hJ0eRDR3i7hQ/PZ2Tot5keQPyIJLYfIb4v6y78UT2/YcBcNTSA0066iYVjs1SLEV3ZW3wp
xShXh6sLvc45bHKItGfIdKwwiiwMcS643dSA1R5nWmotvnkNN7/eD+3MPx+WQftQDxHRBFoXCAgq
Js8JEtupUnoJSo4hAKkVaDxFxMR9H5LfWGZyW4nP9029UYIPPuhBthQLDn2eacyOuGUVjitq9IMH
/pcNOcGtKMTGA/2sZ/uFKJYp8/7ha+7chi9zvouXChHKCrD5TWG6LR2EaP58tXK66fdbiBxRNWRZ
xyJyGrIbk/hdIKgzKmWRQnfYxfWW3Cds65zJ7BMcrP/1y0BTMQ+4QFHfZ3v3+SIVgNQY76jiq7Yf
4e+KXrCQl4TVI7dikqWFXL6Xhw2b/EiG8R8v7/YqLYwblmKXvBKEwHdnZcxnsteABC6CLDaEus2S
aFfKUE4QTqdtLrkmj/KKd1YOFA+gRvAgzNuAgFr0HMD1uElaAXZlVCo0aFyidI/bGjzxcbAFWXmk
mMru5c7UXTauI9bcsYX/KlYKnRrC/T1pJNZYQFPCjpsxCMBKnd9BPjKeAg9lRaacRtrubW5BK4+Q
yZX/IGMaevuMceHWurqSTcXyIRp4hJqgwdOqRMsccEyNh4d0AoLLry9IpYu1VnHS9/j1HZnNbHpW
jmU=
=PzKm
-----END PGP SIGNATURE-----

--------------sKXktxSX2QeYrt3OBJ9eAnFc--
