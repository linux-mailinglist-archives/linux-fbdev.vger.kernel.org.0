Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0786552603F
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 May 2022 12:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379608AbiEMKsR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 13 May 2022 06:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379607AbiEMKsR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 13 May 2022 06:48:17 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAA623EB67;
        Fri, 13 May 2022 03:48:15 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 49F3B1F45F;
        Fri, 13 May 2022 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1652438894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rhHOc/Z06hENT1S5kekmKKaoOwN1rfkmg23j1Yp+J4Q=;
        b=dpUWeqhaXQ7SldMIfSMOqbD7FROM9TS+ZetHXyjidhQD4rsh9IvJBnV5Hjgr2f2BOZBcxu
        RfqL6F5wu722QZGW7HLoEeOsxqwaVthZK5EqjGnlDSojIMbzAg1KtWq8E7fOBAvFb1Nsa1
        rvcJlqSu+j17G/cvhKyGCk5lxoC8qjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1652438894;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rhHOc/Z06hENT1S5kekmKKaoOwN1rfkmg23j1Yp+J4Q=;
        b=z+83ugHe4pdPrUHt4x3/Se5kSn9SGVGSpBJkudNLClcQD6zqH2QZIi62IdygzEMXV5XxrQ
        mSwkZ7DUQ4GGn/Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 092A913446;
        Fri, 13 May 2022 10:48:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id z+OeAG43fmLFJQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 13 May 2022 10:48:14 +0000
Message-ID: <f726c96b-1924-841f-0125-9f7ed37de20a@suse.de>
Date:   Fri, 13 May 2022 12:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 0/7] Fix some races between sysfb device registration
 and drivers probe
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
        Peter Jones <pjones@redhat.com>, linux-doc@vger.kernel.org,
        linux-fbdev@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220511112438.1251024-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1lHm3ELXaiWuWiq3Om2nBLOA"
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1lHm3ELXaiWuWiq3Om2nBLOA
Content-Type: multipart/mixed; boundary="------------KcWhkFL00gZs3f5psKSqt06W";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Peter Jones <pjones@redhat.com>,
 linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org
Message-ID: <f726c96b-1924-841f-0125-9f7ed37de20a@suse.de>
Subject: Re: [PATCH v5 0/7] Fix some races between sysfb device registration
 and drivers probe
References: <20220511112438.1251024-1-javierm@redhat.com>
In-Reply-To: <20220511112438.1251024-1-javierm@redhat.com>

--------------KcWhkFL00gZs3f5psKSqt06W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyLA0KDQp0aGFua3MgYWdhaW4gZm9yIHByb3ZpZGluZyB0aGUgZXhhbXBsZXMu
IEkgdGhpbmsgSSBub3cgYmV0dGVyIGdldCB3aGF0IA0KeW91J3JlIHRyeWluZyB0byBzb2x2
ZS4NCg0KRmlyc3Qgb2YgYWxsIGxldCdzIG1lcmdlIHBhdGNoIDMsIGFzIGl0IHNlZW1zIHVu
cmVsYXRlZC4NCg0KRm9yIHRoZSBvdGhlciBwYXRjaGVzLCBJJ2QgbGlrZSB0byB0YWtlIGEg
c3RlcCBiYWNrIGFuZCB0cnkgdG8gc29sdmUgdGhlIA0KYnJvYWRlciBwcm9ibGVtLiBJSVJD
IHdlIHRhbGtlZCBhYm91dCB0aGlzIGJyaWVmbHkgYWxyZWFkeS4NCg0KIEZyb20gbXkgdW5k
ZXJzdGFuZGluZywgdGhlIHByb2JsZW0gb2YgdGhlIGN1cnJlbnQgY29kZSBpcyB0aGF0IHJl
bW92YWwgDQpvZiB0aGUgZmlybXdhcmUgZGV2aWNlIGlzIGJ1aWxkIGFyb3VuZCBkcml2ZXJz
IChlaXRoZXIgRFJNIG9yIGZiZGV2KS4gDQpFdmVyeXRoaW5nIHdvcmtzIGZpbmUgaWYgYSBk
cml2ZXIgaXMgYm91bmQgdG8gdGhlIGZpcm13YXJlIGRldmljZSBhbmQgDQp0aGUgbmF0aXZl
IGRyaXZlciBjYW4gcmVtb3ZlIGl0LiAgSW4gb3RoZXIgY2FzZSwgd2UgaGF2ZSB0byBtYW51
YWxseSANCmRpc2FibGUgc3lzZmIgYW5kIGZvcmNlLXJlbW92ZSB1bmJvdW5kIGZpcm13YXJl
IGRldmljZXMuICBBbmQgdGhlIA0KcGF0Y2hzZXQgZG9lc24ndCBldmVuIGNvdmVyIGZpcm13
YXJlIGRldmljZXMgdGhhdCBjb21lIGZyb20gRFQgbm9kZXMuDQoNCkJ1dCB3aGF0IHdlIHJl
YWxseSB3YW50IGlzIHRvIHRyYWNrIHJlc291cmNlIG93bmVyc2hpcCBiYXNlZCBvbiBkZXZp
Y2VzLiANCldoZW4gd2UgYWRkIGEgZmlybXdhcmUgZGV2aWNlICh2aWEgc3lzZmIgb3IgRFQp
LCB3ZSBpbW1lZGlhdGVseSBhZGQgaXQgDQp0byBhIGxpc3Qgb2YgZmlybXdhcmUgZGV2aWNl
cy4gV2hlbiB0aGUgbmF0aXZlIGRyaXZlciBhcnJpdmVzLCBpdCBjYW4gDQpyZW1vdmUgdGhl
IGZpcm13YXJlIGRldmljZSBldmVuIGlmIG5vIGRyaXZlciBoYXMgYmVlbiBib3VuZC4NCg0K
V2UgY2FuIGFsc28gb3BlcmF0ZSBpbiB0aGUgb3RoZXIgd2F5IGlmIHRoZSBuYXRpdmUgZHJp
dmVycyBpbXBsaWNpdGx5IA0KcmVzZXJ2ZXMgdGhlIGZyYW1lYnVmZmVyIHJhbmdlLiBJZiBz
eXNmYiB3b3VsZCB0cnkgdG8gcmVnaXN0ZXIgYSANCmZpcm13YXJlIGRldmljZSBpbiB0aGF0
IHJhbmdlLCBoZSBjYW4gbGV0IGl0IGZhaWwuIE5vIG1vcmUgbmVlZCB0byBmdWxseSANCmRp
c2FibGUgc3lzZmIgb24gdGhlIGZpcnN0IGFycml2aW5nIG5hdGl2ZSBkZXZpY2UuDQoNCldl
IGFscmVhZHkgdHJhY2sgdGhlIG1lbW9yeSByYW5nZXMgaW4gZHJtIGFwZXJ0dXJlIGhlbHBl
cnMuIFdlJ2QgbmVlZCB0byANCm1vdmUgdGhlIGNvZGUgdG8gYSBtb3JlIHByb21pbmVudCBs
b2NhdGlvbiAoZS5nLiwgPGxpbnV4L2FwZXJ0dXJlLmg+KSANCmFuZCBjaGFuZ2UgZmJkZXYg
dG8gdXNlIGl0LiBTeXNmYiBhbmQgRFQgY29kZSBuZWVkcyB0byBpbnNlcnQgcGxhdGZvcm0g
DQpkZXZpY2VzIHVwb24gY3JlYXRpb24uIFdlIGNhbiB0aGVuIGltcGxlbWVudCB0aGUgbW9y
ZSBmYW5jeSBzdHVmZiwgc3VjaCANCmFzIHRyYWNraW5nIG5hdGl2ZS1kZXZpY2UgbWVtb3J5
LiAgKEFuZCBpZiB3ZSBldmVyIGdldCB0byBmaXggYWxsIHVzYWdlIA0Kb2YgTGludXgnIHJl
cXVlc3QtbWVtLXJlZ2lvbiwgd2UgY2FuIGV2ZW4gbW92ZSBhbGwgdGhlIGZ1bmN0aW9uYWxp
dHkgdGhlcmUpLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCkFtIDExLjA1LjIyIHVt
IDEzOjI0IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzOg0KPiBIZWxsbywNCj4g
DQo+IFRoZSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGNvbnRhaW4gbW9zdGx5IGNoYW5nZXMg
c3VnZ2VzdGVkIGJ5IERhbmllbCBWZXR0ZXINCj4gVGhvbWFzIFppbW1lcm1hbm4uIFRoZXkg
YWltIHRvIGZpeCBleGlzdGluZyByYWNlcyBiZXR3ZWVuIHRoZSBHZW5lcmljIFN5c3RlbQ0K
PiBGcmFtZWJ1ZmZlciAoc3lzZmIpIGluZnJhc3RydWN0dXJlIGFuZCB0aGUgZmJkZXYgYW5k
IERSTSBkZXZpY2UgcmVnaXN0cmF0aW9uLg0KPiANCj4gRm9yIGV4YW1wbGUsIGl0IGlzIGN1
cnJlbnRseSBwb3NzaWJsZSBmb3Igc3lzZmIgdG8gcmVnaXN0ZXIgYSBwbGF0Zm9ybQ0KPiBk
ZXZpY2UgYWZ0ZXIgYSByZWFsIERSTSBkcml2ZXIgd2FzIHJlZ2lzdGVyZWQgYW5kIHJlcXVl
c3RlZCB0byByZW1vdmUgdGhlDQo+IGNvbmZsaWN0aW5nIGZyYW1lYnVmZmVycy4gT3IgaXMg
cG9zc2libGUgZm9yIGEgc2ltcGxle2ZiLGRybX0gdG8gbWF0Y2ggd2l0aA0KPiBhIGRldmlj
ZSBwcmV2aW91c2x5IHJlZ2lzdGVyZWQgYnkgc3lzZmIsIGV2ZW4gYWZ0ZXIgYSByZWFsIGRy
aXZlciBpcyBwcmVzZW50Lg0KPiANCj4gQSBzeW1wdG9tIG9mIHRoaXMgaXNzdWUsIHdhcyB3
b3JrZWQgYXJvdW5kIHdpdGggdGhlIGNvbW1pdCBmYjU2MWJmOWFiZGUNCj4gKCJmYmRldjog
UHJldmVudCBwcm9iaW5nIGdlbmVyaWMgZHJpdmVycyBpZiBhIEZCIGlzIGFscmVhZHkgcmVn
aXN0ZXJlZCIpDQo+IGJ1dCB0aGF0J3MgcmVhbGx5IGEgaGFjayBhbmQgc2hvdWxkIGJlIHJl
dmVydGVkIGluc3RlYWQuDQo+IA0KPiBUaGlzIHNlcmllcyBhdHRlbXB0IHRvIGZpeCBpdCBt
b3JlIGNvcnJlY3RseSBhbmQgcmV2ZXJ0IHRoZSBtZW50aW9uZWQgaGFjay4NCj4gVGhhdCB3
aWxsIGFsc28gYWxsb3cgdG8gbWFrZSB0aGUgbnVtX3JlZ2lzdGVyZWRfZmIgdmFyaWFibGUg
bm90IHZpc2libGUgdG8NCj4gZHJpdmVycyBhbnltb3JlLCBzaW5jZSB0aGF0J3MgaW50ZXJu
YWwgdG8gZmJkZXYgY29yZS4NCj4gDQo+IFBhY2ggMSBpcyBqdXN0IGEgc2ltcGxlIGNsZWFu
dXAgaW4gcHJlcGFyYXRpb24gZm9yIGxhdGVyIHBhdGNoZXMuDQo+IA0KPiBQYXRjaCAyIGFk
ZCBhIHN5c2ZiX2Rpc2FibGUoKSBhbmQgc3lzZmJfdHJ5X3VucmVnaXN0ZXIoKSBoZWxwZXJz
IHRvIGFsbG93DQo+IGRpc2FibGluZyBzeXNmYiBhbmQgYXR0ZW1wdCB0byB1bnJlZ2lzdGVy
IHJlZ2lzdGVyZWQgZGV2aWNlcyByZXNwZWN0aXZlbHkuDQo+IA0KPiBQYXRjaCAzIGNoYW5n
ZXMgaG93IGlzIGRlYWx0IHdpdGggY29uZmxpY3RpbmcgZnJhbWVidWZmZXJzIHVucmVnaXN0
ZXJpbmcsDQo+IHJhdGhlciB0aGFuIGhhdmluZyBhIHZhcmlhYmxlIHRvIGRldGVybWluZSBp
ZiBhIGxvY2sgc2hvdWxkIGJlIHRha2UsIGl0DQo+IGp1c3QgZHJvcHMgdGhlIGxvY2sgYmVm
b3JlIHVucmVnaXN0ZXJpbmcgdGhlIHBsYXRmb3JtIGRldmljZS4NCj4gDQo+IFBhdGNoIDQg
Y2hhbmdlcyB0aGUgZmJkZXYgY29yZSB0byBub3QgYXR0ZW1wdCB0byB1bnJlZ2lzdGVyIGRl
dmljZXMgdGhhdA0KPiB3ZXJlIHJlZ2lzdGVyZWQgYnkgc3lzZmIsIGxldCB0aGUgc2FtZSBj
b2RlIGRvaW5nIHRoZSByZWdpc3RyYXRpb24gdG8gYWxzbw0KPiBoYW5kbGUgdGhlIHVucmVn
aXN0cmF0aW9uLg0KPiANCj4gUGF0Y2ggNSBmaXhlcyB0aGUgcmFjZSB0aGF0IGV4aXN0cyBi
ZXR3ZWVuIHN5c2ZiIGRldmljZXMgcmVnaXN0cmF0aW9uIGFuZA0KPiBmYmRldiBmcmFtZWJ1
ZmZlciBkZXZpY2VzIHJlZ2lzdHJhdGlvbiwgYnkgZGlzYWJsaW5nIHRoZSBzeXNmYiB3aGVu
IGEgRFJNDQo+IG9yIGZiZGV2IGRyaXZlciByZXF1ZXN0cyB0byByZW1vdmUgY29uZmxpY3Rp
bmcgZnJhbWVidWZmZXJzLg0KPiANCj4gUGF0Y2ggNiBpcyB0aGUgcmV2ZXJ0IHBhdGNoIHRo
YXQgd2FzIHBvc3RlZCBieSBEYW5pZWwgYmVmb3JlIGJ1dCBkcm9wcGVkDQo+IGZyb20gaGlz
IHNldCBhbmQgZmluYWxseSBwYXRjaCA3IGlzIHRoZSBvbmUgdGhhdCBtYWtlcyBudW1fcmVn
aXN0ZXJlZF9mYg0KPiBwcml2YXRlIHRvIGZibWVtLmMsIHRvIG5vdCBhbGxvdyBkcml2ZXJz
IHRvIHVzZSBpdCBhbnltb3JlLg0KPiANCj4gVGhlIHBhdGNoZXMgd2VyZSB0ZXN0ZWQgb24g
YSBycGk0IHdpdGggdGhlIHZjNCwgc2ltcGxlZHJtIGFuZCBzaW1wbGVmYg0KPiBkcml2ZXJz
LCB1c2luZyBkaWZmZXJlbnQgY29tYmluYXRpb25zIG9mIGJ1aWx0LWluIGFuZCBhcyBhIG1v
ZHVsZS4NCj4gDQo+IEZvciBleGFtcGxlLCBoYXZpbmcgc2ltcGxlZHJtIGFzIGEgbW9kdWxl
IGFuZCBsb2FkaW5nIGl0IGFmdGVyIHRoZSB2YzQNCj4gZHJpdmVyIHByb2JlZCB3b3VsZCBu
b3QgcmVnaXN0ZXIgYSBEUk0gZGV2aWNlLCB3aGljaCBoYXBwZW5zIG5vdyB3aXRob3V0DQo+
IHRoZSBwYXRjaGVzIGZyb20gdGhpcyBzZXJpZXMuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+
IEphdmllcg0KPiANCj4gQ2hhbmdlcyBpbiB2NToNCj4gLSBNb3ZlIHRoZSBzeXNmYl9kaXNh
YmxlKCkgY2FsbCBhdCBjb25mbGljdGluZyBmcmFtZWJ1ZmZlcnMgYWdhaW4gdG8NCj4gICAg
YXZvaWQgdGhlIG5lZWQgb2YgYSBEUklWRVJfRklSTVdBUkUgY2FwYWJpbGl0eSBmbGFnLg0K
PiAtIEFkZCBEYW5pZWwgVmV0dGVyJ3MgUmV2aWV3ZWQtYnkgdGFnIGFnYWluIHNpbmNlIHJl
dmVydGVkIHRvIHRoZSBvbGQNCj4gICAgcGF0Y2ggdGhhdCBoZSBhbHJlYWR5IHJldmlld2Vk
IGluIHYyLg0KPiAtIERyb3AgcGF0Y2hlcyB0aGF0IGFkZGVkIGEgRFJNX0ZJUk1XQVJFIGNh
cGFiaWxpdHkgYW5kIHVzZSB0aGVtDQo+ICAgIHNpbmNlIHRoZSBjYXNlIHRob3NlIHByZXZl
bnRlZCBjb3VsZCBiZSBpZ25vcmVkIChEYW5pZWwgVmV0dGVyKS4NCj4gDQo+IENoYW5nZXMg
aW4gdjQ6DQo+IC0gTWFrZSBzeXNmYl9kaXNhYmxlKCkgdG8gYWxzbyBhdHRlbXB0IHRvIHVu
cmVnaXN0ZXIgYSBkZXZpY2UuDQo+IC0gRHJvcCBjYWxsIHRvIHN5c2ZiX2Rpc2FibGUoKSBp
biBmYm1lbSBzaW5jZSBpcyBkb25lIGluIG90aGVyIHBsYWNlcyBub3cuDQo+IC0gQWRkIHBh
dGNoIHRvIG1ha2UgcmVnaXN0ZXJlZF9mYltdIHByaXZhdGUuDQo+IC0gQWRkIHBhdGNoZXMg
dGhhdCBpbnRyb2R1Y2UgdGhlIERSTV9GSVJNV0FSRSBjYXBhYmlsaXR5IGFuZCB1c2FnZS4N
Cj4gDQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gQWRkIFRob21hcyBaaW1tZXJtYW5uJ3MgUmV2
aWV3ZWQtYnkgdGFnIHRvIHBhdGNoICMxLg0KPiAtIENhbGwgc3lzZmJfZGlzYWJsZSgpIHdo
ZW4gYSBEUk0gZGV2IGFuZCBhIGZiZGV2IGFyZSByZWdpc3RlcmVkIHJhdGhlcg0KPiAgICB0
aGFuIHdoZW4gY29uZmxpY3RpbmcgZnJhbWVidWZmZXJzIGFyZSByZW1vdmVkIChUaG9tYXMg
WmltbWVybWFubikuDQo+IC0gQ2FsbCBzeXNmYl9kaXNhYmxlKCkgd2hlbiBhIGZiZGV2IGZy
YW1lYnVmZmVyIGlzIHJlZ2lzdGVyZWQgcmF0aGVyDQo+ICAgIHRoYW4gd2hlbiBjb25mbGlj
dGluZyBmcmFtZWJ1ZmZlcnMgYXJlIHJlbW92ZWQgKFRob21hcyBaaW1tZXJtYW5uKS4NCj4g
LSBEcm9wIERhbmllbCBWZXR0ZXIncyBSZXZpZXdlZC1ieSB0YWcgc2luY2UgcGF0Y2ggY2hh
bmdlZCBhIGxvdC4NCj4gLSBSZWJhc2Ugb24gdG9wIG9mIGxhdGVzdCBkcm0tbWlzYy1uZXh0
IGJyYW5jaC4NCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gUmViYXNlIG9uIHRvcCBvZiBs
YXRlc3QgZHJtLW1pc2MtbmV4dCBhbmQgZml4IGNvbmZsaWN0cyAoRGFuaWVsIFZldHRlciku
DQo+IC0gQWRkIGtlcm5lbC1kb2MgY29tbWVudHMgYW5kIGluY2x1ZGUgaW4gb3RoZXJfaW50
ZXJmYWNlcy5yc3QgKERhbmllbCBWZXR0ZXIpLg0KPiAtIEV4cGxhaW4gaW4gdGhlIGNvbW1p
dCBtZXNzYWdlIHRoYXQgZmJtZW0gaGFzIHRvIHVucmVnaXN0ZXIgdGhlIGRldmljZQ0KPiAg
ICBhcyBmYWxsYmFjayBpZiBhIGRyaXZlciByZWdpc3RlcmVkIHRoZSBkZXZpY2UgaXRzZWxm
IChEYW5pZWwgVmV0dGVyKS4NCj4gLSBBbHNvIGV4cGxhaW4gdGhhdCBmYWxsYmFjayBpbiBh
IGNvbW1lbnQgaW4gdGhlIGNvZGUgKERhbmllbCBWZXR0ZXIpLg0KPiAtIERvbid0IGVuY29k
ZSBpbiBmYm1lbSB0aGUgYXNzdW1wdGlvbiB0aGF0IHN5c2ZiIHdpbGwgYWx3YXlzIHJlZ2lz
dGVyDQo+ICAgIHBsYXRmb3JtIGRldmljZXMgKERhbmllbCBWZXR0ZXIpLg0KPiAtIEFkZCBh
IEZJWE1FIGNvbW1lbnQgYWJvdXQgZHJpdmVycyByZWdpc3RlcmluZyBkZXZpY2VzIChEYW5p
ZWwgVmV0dGVyKS4NCj4gLSBFeHBsYWluIGluIHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IGZi
bWVtIGhhcyB0byB1bnJlZ2lzdGVyIHRoZSBkZXZpY2UNCj4gICAgYXMgZmFsbGJhY2sgaWYg
YSBkcml2ZXIgcmVnaXN0ZXJlZCB0aGUgZGV2aWNlIGl0c2VsZiAoRGFuaWVsIFZldHRlciku
DQo+IC0gQWxzbyBleHBsYWluIHRoYXQgZmFsbGJhY2sgaW4gYSBjb21tZW50IGluIHRoZSBj
b2RlIChEYW5pZWwgVmV0dGVyKS4NCj4gLSBEb24ndCBlbmNvZGUgaW4gZmJtZW0gdGhlIGFz
c3VtcHRpb24gdGhhdCBzeXNmYiB3aWxsIGFsd2F5cyByZWdpc3Rlcg0KPiAgICBwbGF0Zm9y
bSBkZXZpY2VzIChEYW5pZWwgVmV0dGVyKS4NCj4gLSBBZGQgYSBGSVhNRSBjb21tZW50IGFi
b3V0IGRyaXZlcnMgcmVnaXN0ZXJpbmcgZGV2aWNlcyAoRGFuaWVsIFZldHRlcikuDQo+IC0g
RHJvcCBSRkMgcHJlZml4IHNpbmNlIHBhdGNoZXMgd2VyZSBhbHJlYWR5IHJldmlld2VkIGJ5
IERhbmllbCBWZXR0ZXIuDQo+IC0gQWRkIERhbmllbCBSZXZpZXdlZC1ieSB0YWdzIHRvIHRo
ZSBwYXRjaGVzLg0KPiANCj4gRGFuaWVsIFZldHRlciAoMik6DQo+ICAgIFJldmVydCAiZmJk
ZXY6IFByZXZlbnQgcHJvYmluZyBnZW5lcmljIGRyaXZlcnMgaWYgYSBGQiBpcyBhbHJlYWR5
DQo+ICAgICAgcmVnaXN0ZXJlZCINCj4gICAgZmJkZXY6IE1ha2UgcmVnaXN0ZXJlZF9mYltd
IHByaXZhdGUgdG8gZmJtZW0uYw0KPiANCj4gSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzICg1
KToNCj4gICAgZmlybXdhcmU6IHN5c2ZiOiBNYWtlIHN5c2ZiX2NyZWF0ZV9zaW1wbGVmYigp
IHJldHVybiBhIHBkZXYgcG9pbnRlcg0KPiAgICBmaXJtd2FyZTogc3lzZmI6IEFkZCBoZWxw
ZXJzIHRvIHVucmVnaXN0ZXIgYSBwZGV2IGFuZCBkaXNhYmxlDQo+ICAgICAgcmVnaXN0cmF0
aW9uDQo+ICAgIGZiZGV2OiBSZXN0YXJ0IGNvbmZsaWN0aW5nIGZiIHJlbW92YWwgbG9vcCB3
aGVuIHVucmVnaXN0ZXJpbmcgZGV2aWNlcw0KPiAgICBmYmRldjogTWFrZSBzeXNmYiB0byB1
bnJlZ2lzdGVyIGl0cyBvd24gcmVnaXN0ZXJlZCBkZXZpY2VzDQo+ICAgIGZiZGV2OiBEaXNh
YmxlIHN5c2ZiIGRldmljZSByZWdpc3RyYXRpb24gd2hlbiByZW1vdmluZyBjb25mbGljdGlu
ZyBGQnMNCj4gDQo+ICAgLi4uL2RyaXZlci1hcGkvZmlybXdhcmUvb3RoZXJfaW50ZXJmYWNl
cy5yc3QgIHwgIDYgKysNCj4gICBkcml2ZXJzL2Zpcm13YXJlL3N5c2ZiLmMgICAgICAgICAg
ICAgICAgICAgICAgfCA5MSArKysrKysrKysrKysrKysrKy0tDQo+ICAgZHJpdmVycy9maXJt
d2FyZS9zeXNmYl9zaW1wbGVmYi5jICAgICAgICAgICAgIHwgMTYgKystLQ0KPiAgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jICAgICAgICAgICAgICB8IDY3ICsrKysrKysr
KysrLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9lZmlmYi5jICAgICAgICAgICAgICAg
ICAgIHwgMTEgLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9zaW1wbGVmYi5jICAgICAg
ICAgICAgICAgIHwgMTEgLS0tDQo+ICAgaW5jbHVkZS9saW51eC9mYi5oICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDggKy0NCj4gICBpbmNsdWRlL2xpbnV4L3N5c2ZiLmggICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyOSArKysrKy0NCj4gICA4IGZpbGVzIGNoYW5nZWQs
IDE3OCBpbnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkNCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------KcWhkFL00gZs3f5psKSqt06W--

--------------1lHm3ELXaiWuWiq3Om2nBLOA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ+N20FAwAAAAAACgkQlh/E3EQov+Cd
ng/7Bih7tTEQtZf3G754zHjE0/iiRMV1+ZAkMpCJk/TD5a3DxZ3izcffh2D77A38RtWhXG7VpdkC
nSPG0z9cN5RaEbUCue/BYCnEztMVahEs0+3u8s/Ad57yEtroJgHBm56sqY+372rTDt2drzbBH3yv
sovtt316IdyLgWSOq1YyH2xyqCiFx7ZdkGV8I/u2jAVsqsic0ODVfOXabOTMuUdZxXQJpTl9MgW5
Egan/ABubU/zFvWNtT0p3A2CxVcRKx7IcWdzx2oGzKlKNl21NNQSB/OyYw7TKBqSpGDcLNK/uOVQ
8wOlisrScrUa8lCSwV2XwBFCAfZ/dEw1nuWWzHmh8Tg1yw4j32s587+xgLVoly1kUUBIncXT7UY4
PSCdmESsqt5Fz/D+hmcobVPG6rnqrlnkL8J50i+7xDq62iA3t3ezuKo2WPbGGr21zDqWGrstHqp+
6a81bFkHSyMVgNUyQd1+rllea3gT2CApW+reKUH+nNW4TyDTI+TSu5PP1HOUxoJ0Vtxz2xjFLhvo
cep6P9R+Eh5uFCV4XdMiUHYF3YuDtlPh/UOT5FfcKdSD5yYnitCclcpzGXYCrAPX82XArZQo6SGq
e0BDBH6TEk2OEqjMbPkkx6oc1oMRpwQGUTIM2Z5mWTPJQ2MzbfRn5BYlx9K+SzFprktFBqfuLQT/
mqI=
=t4MK
-----END PGP SIGNATURE-----

--------------1lHm3ELXaiWuWiq3Om2nBLOA--
