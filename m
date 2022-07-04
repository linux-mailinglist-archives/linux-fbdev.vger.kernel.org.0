Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACF756550E
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 Jul 2022 14:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbiGDMWs (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 4 Jul 2022 08:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbiGDMWn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 4 Jul 2022 08:22:43 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7D5B6;
        Mon,  4 Jul 2022 05:22:42 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 6839C1FEE8;
        Mon,  4 Jul 2022 12:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1656937361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lMi/mKI3IgFFyMm2b4EJclOuQIMJXNAzxv7T3WptnrQ=;
        b=ISxXfAdsRMMg0HEM4p33QLu7LIU6G2pycbgNVPYODQVHKhESlmtMGfia9Ti9kBRx0Aw+12
        oZn7E52HFGBfUoeD3IEF4k8OsWjqrzKMpDzdmWHV76HdxqQrylFyo5NRfDDxiqlZtSZ0l9
        BLI1N0DipXMOgFxarUb6JoXxcGTxx9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1656937361;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lMi/mKI3IgFFyMm2b4EJclOuQIMJXNAzxv7T3WptnrQ=;
        b=b3xmMnlf/SIALgu97V718o24klhIWzselU3QBQOEYsS16N4qNDFKF5nCmxs0r80j7ThoA7
        iAzbuATfpd1dAQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27D9D13451;
        Mon,  4 Jul 2022 12:22:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id nvFVCJHbwmK+KQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 04 Jul 2022 12:22:41 +0000
Message-ID: <70556947-1849-c73a-2b9a-6132aca1c055@suse.de>
Date:   Mon, 4 Jul 2022 14:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
Content-Language: en-US
To:     Xi Ruoyao <xry111@linuxfromscratch.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Zack Rusin <zackr@vmware.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "deller@gmx.de" <deller@gmx.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
        Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
        "kraxel@redhat.com" <kraxel@redhat.com>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "lersek@redhat.com" <lersek@redhat.com>
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-4-javierm@redhat.com>
 <de83ae8cb6de7ee7c88aa2121513e91bb0a74608.camel@vmware.com>
 <38473dcd-0666-67b9-28bd-afa2d0ce434a@redhat.com>
 <603e3613b9b8ff7815b63f294510d417b5b12937.camel@vmware.com>
 <a633d605-4cb3-2e04-1818-85892cf6f7b0@redhat.com>
 <97565fb5-cf7f-5991-6fb3-db96fe239ee8@redhat.com>
 <711c88299ef41afd8556132b7c1dcb75ee7e6117.camel@vmware.com>
 <aa144e20-a555-5c30-4796-09713c12ab0e@redhat.com>
 <64c753c98488a64b470009e45769ceab29fd8130.camel@linuxfromscratch.org>
 <61f2e4e2af40cb9d853504d0a6fe01829ff8ca60.camel@linuxfromscratch.org>
 <fddf5ca6-77dc-88f9-c191-7de09717063c@redhat.com>
 <2ae767b0439133ca4e60885a1843ee72b69adfc5.camel@linuxfromscratch.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2ae767b0439133ca4e60885a1843ee72b69adfc5.camel@linuxfromscratch.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CMy4IaEhlRt8kLCAyY4sgVL0"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CMy4IaEhlRt8kLCAyY4sgVL0
Content-Type: multipart/mixed; boundary="------------ZK0o8Q57gaJmscwMaRrwtmgM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Xi Ruoyao <xry111@linuxfromscratch.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Zack Rusin
 <zackr@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "lersek@redhat.com" <lersek@redhat.com>
Message-ID: <70556947-1849-c73a-2b9a-6132aca1c055@suse.de>
Subject: Re: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-4-javierm@redhat.com>
 <de83ae8cb6de7ee7c88aa2121513e91bb0a74608.camel@vmware.com>
 <38473dcd-0666-67b9-28bd-afa2d0ce434a@redhat.com>
 <603e3613b9b8ff7815b63f294510d417b5b12937.camel@vmware.com>
 <a633d605-4cb3-2e04-1818-85892cf6f7b0@redhat.com>
 <97565fb5-cf7f-5991-6fb3-db96fe239ee8@redhat.com>
 <711c88299ef41afd8556132b7c1dcb75ee7e6117.camel@vmware.com>
 <aa144e20-a555-5c30-4796-09713c12ab0e@redhat.com>
 <64c753c98488a64b470009e45769ceab29fd8130.camel@linuxfromscratch.org>
 <61f2e4e2af40cb9d853504d0a6fe01829ff8ca60.camel@linuxfromscratch.org>
 <fddf5ca6-77dc-88f9-c191-7de09717063c@redhat.com>
 <2ae767b0439133ca4e60885a1843ee72b69adfc5.camel@linuxfromscratch.org>
In-Reply-To: <2ae767b0439133ca4e60885a1843ee72b69adfc5.camel@linuxfromscratch.org>

--------------ZK0o8Q57gaJmscwMaRrwtmgM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDcuMjIgdW0gMTQ6MTEgc2NocmllYiBYaSBSdW95YW86DQo+IE9uIE1v
biwgMjAyMi0wNy0wNCBhdCAxMzowNCArMDIwMCwgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
IHdyb3RlOg0KPj4gSGVsbG8gWGksDQo+Pj4NCj4+PiBXaXRoIENPTkZJR19TWVNGQl9TSU1Q
TEVGQiBhbmQgQ09ORklHX0ZCX1NJTVBMRSBlbmFibGVkLCB0aGVyZSBpcyBubw0KPj4+IGlz
c3VlLg0KPj4+DQo+Pj4gSSBndWVzcyBpdCdzIHNvbWV0aGluZyBnb2luZyB3cm9uZyBvbiBh
ICJkcm0gLT4gZHJtIiBwYXNzIG92ZXIuwqAgRm9yIG5vdw0KPj4+IEknbGwgY29udGludWUg
dG8gdXNlIHNpbXBsZWRybSB3aXRoIHRoaXMgY29tbWl0IHJldmVydGVkLg0KPj4+DQo+Pg0K
Pj4gWWVzLCB3ZSBuZWVkIHRvIGFsc28gY2hlcnJ5LXBpY2sgYjg0ZWZhMjhhNDggKCJkcm0v
YXBlcnR1cmU6IFJ1biBmYmRldg0KPj4gcmVtb3ZhbCBiZWZvcmUgaW50ZXJuYWwgaGVscGVy
cyIpIG5vdyB0aGF0IHRoZSBzeXNmYl9kaXNhYmxlKCkgcGF0Y2hlcw0KPj4gYXJlIGluIHY1
LjE5LXJjNS4NCj4gDQo+IEkgY29uZmlybSB0aGF0IGNoZXJyeS1waWNraW5nIGI4NGVmYTI4
YTQ4IGZpeGVzIHRoZSBpc3N1ZSBmb3IgdjUuMTktcmM1Lg0KDQpJJ3ZlIGNoZXJyeS1waWNr
ZWQgdGhlIGNvbW1pdCBpbnRvIGRybS1taXNjLWZpeGVzLiBJdCB3aWxsIHNob3cgdXAgaW4g
DQptYWlubGluZSBzb29uLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------ZK0o8Q57gaJmscwMaRrwtmgM--

--------------CMy4IaEhlRt8kLCAyY4sgVL0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLC25AFAwAAAAAACgkQlh/E3EQov+D6
qw/8DMh/+FZ7015LO3/tn/cALCKklbd6z+cuLJOtvDIUldy+s05bX8zCarSv5mUWuGzuLd+wLwv3
dqB2VYi+vs0ZfXZFfiDNiKLKtRFQQnV8nZS8uXX2ANQYvMqtAgFDAKnuDbEIRm+0Cspa7cyLaVqA
HWa7qFVYuntlveO+f0j2ajsFybVDR7qcNcR0S5ZkpTR/FM46SrdHddkSdf4TpJ9GnzlT4tVpnzvp
MiiQQlJJKtp4V5GDoBpMPfNz0MUWIXr3Vu+JObWDju2k2eS7SkFxIyFAIjpw7sO8kpnEOwETCwoa
mbq6SeDQDtC4U/FsKjQ1RXLjngOL4aUxsbXgom17IxnEU1jVXjGhlMEtXYwQq4qmFYG5QRd7BjLE
ugfow95aifWwdI5sLk9eJnEoacJ3/L0Z7lTZjLKAM71GgzpkoMEzJJjGK8yKyBv/kfp39PLOKpWK
qH1bNhTqx8fsEg4U3+Z7BPwn5a34cxvZLCY4KfJedgqwhDe1SwadKwje2p0H27omuQQSYjLMQT5t
VI2lFhUoCXh6ZJhgmsjX5M/9BEqceQWnJ9aO/dFv9A413Em9RwAIQkb/FraFEGmrMQYFXb5HcJpb
vgxefroMjq2nWMYbaPJoXvovGl2+g/fZDkpGE16gYlmTRXt6Z6P1f27yAmU5j5mM5TxSitWeUduF
8Fk=
=I+c+
-----END PGP SIGNATURE-----

--------------CMy4IaEhlRt8kLCAyY4sgVL0--
