Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5850E62DA57
	for <lists+linux-fbdev@lfdr.de>; Thu, 17 Nov 2022 13:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239989AbiKQMH2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 17 Nov 2022 07:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239973AbiKQMHX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 17 Nov 2022 07:07:23 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A5D6EB7A
        for <linux-fbdev@vger.kernel.org>; Thu, 17 Nov 2022 04:07:21 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 995DA1F8D5;
        Thu, 17 Nov 2022 12:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1668686840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T1P53PSPmZj8BycHB9QGMQ25PfB2A/W6UdVkyB14pyo=;
        b=Ks32PxodvtgslgVvgxDvf32Tb6+AKwWat3LsjahNLhdWT4yWkH4lMTOuempqwdVALMhXbK
        PupoNXk3h4aL3CuuFkWqkrtDv5f12j41eM4MrUe2BOBR552/RErUXzHHVnbhOtzB1rOUpu
        JhVbhDYc5gKrzoJuRLAzhWbQ564KTis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1668686840;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T1P53PSPmZj8BycHB9QGMQ25PfB2A/W6UdVkyB14pyo=;
        b=1Szz83Rgb6fuPgfym3fBG5dfCK1whLdWjKfbiQfAWkIrqCOixxCI9A/RqPSwF88NNBPUJ4
        ZIn4YAQQS37zlMCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E22A13B56;
        Thu, 17 Nov 2022 12:07:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OK3YGfgjdmPCTQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 17 Nov 2022 12:07:20 +0000
Message-ID: <320e795d-ebe5-f5a3-fc57-5c54d30b1a5a@suse.de>
Date:   Thu, 17 Nov 2022 13:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] fbdev: Make fb_modesetting_disabled() static inline
To:     javierm@redhat.com, deller@gmx.de, sfr@canb.auug.org.au
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <20221117114729.7570-1-tzimmermann@suse.de>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221117114729.7570-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ICmo0ZK8FvAVSeOK6MdZ5XdQ"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ICmo0ZK8FvAVSeOK6MdZ5XdQ
Content-Type: multipart/mixed; boundary="------------AVJVcTmK3PEeJghp1UTw079E";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, sfr@canb.auug.org.au
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <320e795d-ebe5-f5a3-fc57-5c54d30b1a5a@suse.de>
Subject: Re: [PATCH] fbdev: Make fb_modesetting_disabled() static inline
References: <20221117114729.7570-1-tzimmermann@suse.de>
In-Reply-To: <20221117114729.7570-1-tzimmermann@suse.de>

--------------AVJVcTmK3PEeJghp1UTw079E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE3LjExLjIyIHVtIDEyOjQ3IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IE1ha2UgZmJfbW9kZXNldHRpbmdfZGlzYWJsZWQoKSBhIHN0YXRpYy1pbmxpbmUgZnVuY3Rp
b24gd2hlbiBpdCBpcw0KPiBkZWZpbmVkIGluIHRoZSBoZWFkZXIgZmlsZS4gQXZvaWQgdGhl
IGxpbmtlciBlcnJvciBzaG93biBiZWxvdy4NCj4gDQo+ICAgbGQ6IGRyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYm1vbi5vOiBpbiBmdW5jdGlvbiBgZmJfbW9kZXNldHRpbmdfZGlzYWJs
ZWQnOg0KPiAgIGZibW9uLmM6KC50ZXh0KzB4MWU0KTogbXVsdGlwbGUgZGVmaW5pdGlvbiBv
ZiBgZmJfbW9kZXNldHRpbmdfZGlzYWJsZWQnOyBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJtZW0ubzpmYm1lbS5jOigudGV4dCsweDFiYWMpOiBmaXJzdCBkZWZpbmVkIGhlcmUNCj4g
DQo+IEEgYnVnIHJlcG9ydCBpcyBhdCBbMV0uDQo+IA0KPiBSZXBvcnRlZC1ieTogU3RlcGhl
biBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+DQo+IFJlcG9ydGVkLWJ5OiBrZXJu
ZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IEZpeGVzOiAwYmEyZmE4Y2Jk
MjkgKCJmYmRldjogQWRkIHN1cHBvcnQgZm9yIHRoZSBub21vZGVzZXQga2VybmVsIHBhcmFt
ZXRlciIpDQo+IENjOiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0
LmNvbT4NCg0KSmF2aWVyIGdhdmUgaGlzIHItYiB2aWEgaXJjLg0KDQo+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IENjOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBn
bXguZGU+DQo+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvZHJpLWRldmVsLzIwMjIxMTE3MTgzMjE0LjI0NzNlNzQ1QGNhbmIuYXV1Zy5vcmcu
YXUvVC8jdSAjIDENCj4gLS0tDQo+ICAgaW5jbHVkZS9saW51eC9mYi5oIHwgMiArLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUvbGludXgvZmIuaA0K
PiBpbmRleCAzYTgyMmU0MzU3YjEyLi5lYTQyMTcyNGY3MzM4IDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L2ZiLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9mYi5oDQo+IEBAIC04
MDcsNyArODA3LDcgQEAgZXh0ZXJuIGludCBmYl9maW5kX21vZGUoc3RydWN0IGZiX3Zhcl9z
Y3JlZW5pbmZvICp2YXIsDQo+ICAgI2lmIGRlZmluZWQoQ09ORklHX1ZJREVPX05PTU9ERVNF
VCkNCj4gICBib29sIGZiX21vZGVzZXR0aW5nX2Rpc2FibGVkKGNvbnN0IGNoYXIgKmRydm5h
bWUpOw0KPiAgICNlbHNlDQo+IC1ib29sIGZiX21vZGVzZXR0aW5nX2Rpc2FibGVkKGNvbnN0
IGNoYXIgKmRydm5hbWUpDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgZmJfbW9kZXNldHRpbmdf
ZGlzYWJsZWQoY29uc3QgY2hhciAqZHJ2bmFtZSkNCj4gICB7DQo+ICAgCXJldHVybiBmYWxz
ZTsNCj4gICB9DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------AVJVcTmK3PEeJghp1UTw079E--

--------------ICmo0ZK8FvAVSeOK6MdZ5XdQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN2I/cFAwAAAAAACgkQlh/E3EQov+Ca
gA/+LdU3SyeGbcVQXqoVNeJbtsVUYTP7uY/Y52gF+VbVthvfebOhmwjCUQjRFwNKZsz1QlQqGxgh
WjgRHxI2sAu98D5gJS7JdYbSP6v3VrlDYe9StJkhnCu62xgf3ydVoppfy0KgzQkxvzAvIF/iJvf5
9NHF8RQWTiwobCPVFD4Q3YEp5aYWIvOxNU8b4RCDPETAGt4B8z91NjOsnNhpbuGdmgisksxOy8Kk
kfAKE1tsl94Ww7RzxbtIdb95LYetXOcHPn6AGOf3LJkXdr8s6CZorZT8UlReAbqa2tldUNQfpTq8
ZaVDnOeIjVYloMO66ndoYMFiyWvQNPhumeRMAZ67VNzgt/hLRxl3ALhCozF1EBbqfKwnc+KlDqvv
Fs93jrP7IUYN3tyrAz8t13nJ/6LfxJdi/nfUgvoQ1HiFeHFhtKeXqQSUDHZ3MWO1MzAAa26/wipD
GZHTPML09oLmBsSBy9fnHjsfq08O4cBtuVdMVFI9WYiKopYz5NDdF1nZAAwzXBqFyQDDwXL6zizv
Htq0sebIeoA6KjuX/lgZ6chzQDYpI4iHYPDXJuK4tUEVGoK+BvPL7nU0k0ZoMKPYtUuVHeMTh8s9
W5AOOVcQHycvbCSPxi+mMvVxf42Hn6Rg73ShN71I1RdSaGWakEXxZ7LMx8BzKHMzfgf+jfd54dsM
5Sg=
=lhQ1
-----END PGP SIGNATURE-----

--------------ICmo0ZK8FvAVSeOK6MdZ5XdQ--
