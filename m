Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552466EF651
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Apr 2023 16:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240704AbjDZOYK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Apr 2023 10:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240659AbjDZOYJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Apr 2023 10:24:09 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4806710C2
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Apr 2023 07:24:08 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id DC9B7218F2;
        Wed, 26 Apr 2023 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1682519046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n6mQUD1ynKTYG3hNgIqZs81lO+ivxQ/TawT6mi+o4Lo=;
        b=oEXL5HkfbiDZ+vrrx2ox8CrPEfOmfYf/EEI/tK54cOrUn0YMGs593jymPaA274PLMylQkt
        QJelOFjlTCVXY8EWh7HkJ2wrLtiulrGbvqPXerlg+9DU/iliyodvQnXI55Ll+P9iV/HdLT
        liq/THKIl09Z5W02z79JJDDJaXkH9QM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1682519046;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n6mQUD1ynKTYG3hNgIqZs81lO+ivxQ/TawT6mi+o4Lo=;
        b=SCYeYuPa66/XI1iHJ9nvGZt5cwgKkL5IX1nmC/Y1HYukmJrdeqTG1oj/teSWvVZ7NmGUPQ
        goRs0jhdQe1LIEDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C0CD13421;
        Wed, 26 Apr 2023 14:24:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 3bZMJQY0SWQyXgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 14:24:06 +0000
Message-ID: <dbf2c5eb-925e-3e9a-0184-7da78fc7bc76@suse.de>
Date:   Wed, 26 Apr 2023 16:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
        deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com
Cc:     oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20230425142846.730-6-tzimmermann@suse.de>
 <202304261317.QAEwArcB-lkp@intel.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <202304261317.QAEwArcB-lkp@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xYnq0JUGXa0tEBYwb6wV4okH"
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xYnq0JUGXa0tEBYwb6wV4okH
Content-Type: multipart/mixed; boundary="------------DFJl0tM9GVK0ppaU8oCajf0P";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel test robot <lkp@intel.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
 deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com
Cc: oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <dbf2c5eb-925e-3e9a-0184-7da78fc7bc76@suse.de>
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
References: <20230425142846.730-6-tzimmermann@suse.de>
 <202304261317.QAEwArcB-lkp@intel.com>
In-Reply-To: <202304261317.QAEwArcB-lkp@intel.com>

--------------DFJl0tM9GVK0ppaU8oCajf0P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjMgdW0gMDc6MTYgc2NocmllYiBrZXJuZWwgdGVzdCByb2JvdDoN
Cj4gSGkgVGhvbWFzLA0KPiANCj4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9s
bG93aW5nIGJ1aWxkIHdhcm5pbmdzOg0KDQpGWUkgdGhlc2UgZXJyb3JzIGNvbWUgZnJvbSBz
eXN0ZW1zIHRoYXQgdXNlIHZvbGF0aWxlIF9faW9tZW0gcG9pbnRlcnMgDQp3aXRoIHBsYWlu
IG1lbWNweSgpLiBTZWUgbXkgcGF0Y2hzZXQgYXQgWzFdIGZvciBhbiBpbXByb3ZlbWVudC4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvMTE2OTg1Lw0KDQo+IA0KPiBbYXV0byBidWlsZCB0ZXN0IFdB
Uk5JTkcgb24gZHJtLW1pc2MvZHJtLW1pc2MtbmV4dF0NCj4gW2Fsc28gYnVpbGQgdGVzdCBX
QVJOSU5HIG9uIGxpbnVzL21hc3RlciBuZXh0LTIwMjMwNDI1XQ0KPiBbY2Fubm90IGFwcGx5
IHRvIHY2LjNdDQo+IFtJZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdp
dCB0cmVlLCBraW5kbHkgZHJvcCB1cyBhIG5vdGUuDQo+IEFuZCB3aGVuIHN1Ym1pdHRpbmcg
cGF0Y2gsIHdlIHN1Z2dlc3QgdG8gdXNlICctLWJhc2UnIGFzIGRvY3VtZW50ZWQgaW4NCj4g
aHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2VfdHJlZV9p
bmZvcm1hdGlvbl0NCj4gDQo+IHVybDogICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxh
Yi1sa3AvbGludXgvY29tbWl0cy9UaG9tYXMtWmltbWVybWFubi9mYmRldi1SZXR1cm4tbnVt
YmVyLW9mLWJ5dGVzLXJlYWQtb3Itd3JpdHRlbi8yMDIzMDQyNS0yMjMwMTENCj4gYmFzZTog
ICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgZHJtLW1pc2Mt
bmV4dA0KPiBwYXRjaCBsaW5rOiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMw
NDI1MTQyODQ2LjczMC02LXR6aW1tZXJtYW5uJTQwc3VzZS5kZQ0KPiBwYXRjaCBzdWJqZWN0
OiBbUEFUQ0ggNS82XSBmYmRldjogTW92ZSBDRkIgcmVhZCBhbmQgd3JpdGUgY29kZSBpbnRv
IGhlbHBlciBmdW5jdGlvbnMNCj4gY29uZmlnOiByaXNjdi1yYW5kY29uZmlnLXMwMzMtMjAy
MzA0MjMgKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIzMDQy
Ni8yMDIzMDQyNjEzMTcuUUFFd0FyY0ItbGtwQGludGVsLmNvbS9jb25maWcpDQo+IGNvbXBp
bGVyOiByaXNjdjY0LWxpbnV4LWdjYyAoR0NDKSAxMi4xLjANCj4gcmVwcm9kdWNlOg0KPiAg
ICAgICAgICB3Z2V0IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9s
a3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAtTyB+L2Jpbi9tYWtlLmNyb3NzDQo+
ICAgICAgICAgIGNobW9kICt4IH4vYmluL21ha2UuY3Jvc3MNCj4gICAgICAgICAgIyBhcHQt
Z2V0IGluc3RhbGwgc3BhcnNlDQo+ICAgICAgICAgICMgc3BhcnNlIHZlcnNpb246IHYwLjYu
NC0zOS1nY2UxYTY3MjAtZGlydHkNCj4gICAgICAgICAgIyBodHRwczovL2dpdGh1Yi5jb20v
aW50ZWwtbGFiLWxrcC9saW51eC9jb21taXQvZDRhMTUwZjNkZmE4ZTczZjJlOTJmMWM3ZWZj
OTI3MWUxNzYzMmNjMg0KPiAgICAgICAgICBnaXQgcmVtb3RlIGFkZCBsaW51eC1yZXZpZXcg
aHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgNCj4gICAgICAgICAgZ2l0
IGZldGNoIC0tbm8tdGFncyBsaW51eC1yZXZpZXcgVGhvbWFzLVppbW1lcm1hbm4vZmJkZXYt
UmV0dXJuLW51bWJlci1vZi1ieXRlcy1yZWFkLW9yLXdyaXR0ZW4vMjAyMzA0MjUtMjIzMDEx
DQo+ICAgICAgICAgIGdpdCBjaGVja291dCBkNGExNTBmM2RmYThlNzNmMmU5MmYxYzdlZmM5
MjcxZTE3NjMyY2MyDQo+ICAgICAgICAgICMgc2F2ZSB0aGUgY29uZmlnIGZpbGUNCj4gICAg
ICAgICAgbWtkaXIgYnVpbGRfZGlyICYmIGNwIGNvbmZpZyBidWlsZF9kaXIvLmNvbmZpZw0K
PiAgICAgICAgICBDT01QSUxFUl9JTlNUQUxMX1BBVEg9JEhPTUUvMGRheSBDT01QSUxFUj1n
Y2MtMTIuMS4wIG1ha2UuY3Jvc3MgQz0xIENGPSctZmRpYWdub3N0aWMtcHJlZml4IC1EX19D
SEVDS19FTkRJQU5fXycgTz1idWlsZF9kaXIgQVJDSD1yaXNjdiBvbGRkZWZjb25maWcNCj4g
ICAgICAgICAgQ09NUElMRVJfSU5TVEFMTF9QQVRIPSRIT01FLzBkYXkgQ09NUElMRVI9Z2Nj
LTEyLjEuMCBtYWtlLmNyb3NzIEM9MSBDRj0nLWZkaWFnbm9zdGljLXByZWZpeCAtRF9fQ0hF
Q0tfRU5ESUFOX18nIE89YnVpbGRfZGlyIEFSQ0g9cmlzY3YgU0hFTEw9L2Jpbi9iYXNoIGRy
aXZlcnMvdmlkZW8vZmJkZXYvY29yZS8NCj4gDQo+IElmIHlvdSBmaXggdGhlIGlzc3VlLCBr
aW5kbHkgYWRkIGZvbGxvd2luZyB0YWcgd2hlcmUgYXBwbGljYWJsZQ0KPiB8IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gfCBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMwNDI2MTMxNy5RQUV3QXJj
Qi1sa3BAaW50ZWwuY29tLw0KPiANCj4gc3BhcnNlIHdhcm5pbmdzOiAobmV3IG9uZXMgcHJl
Zml4ZWQgYnkgPj4pDQo+ICAgICBXQVJOSU5HOiBpbnZhbGlkIGFyZ3VtZW50IHRvICctbWFy
Y2gnOiAnX3ppaGludHBhdXNlJw0KPj4+IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9j
ZmJfZm9wcy5jOjQ0OjM5OiBzcGFyc2U6IHNwYXJzZTogaW5jb3JyZWN0IHR5cGUgaW4gYXJn
dW1lbnQgMiAoZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzKSBAQCAgICAgZXhwZWN0ZWQgdm9p
ZCBjb25zdCAqIEBAICAgICBnb3QgdW5zaWduZWQgY2hhciBbbm9kZXJlZl0gW3VzZXJ0eXBl
XSBfX2lvbWVtICpbYXNzaWduZWRdIHNyYyBAQA0KPiAgICAgZHJpdmVycy92aWRlby9mYmRl
di9jb3JlL2ZiX2NmYl9mb3BzLmM6NDQ6Mzk6IHNwYXJzZTogICAgIGV4cGVjdGVkIHZvaWQg
Y29uc3QgKg0KPiAgICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2NmYl9mb3BzLmM6
NDQ6Mzk6IHNwYXJzZTogICAgIGdvdCB1bnNpZ25lZCBjaGFyIFtub2RlcmVmXSBbdXNlcnR5
cGVdIF9faW9tZW0gKlthc3NpZ25lZF0gc3JjDQo+Pj4gZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZiX2NmYl9mb3BzLmM6MTEzOjMyOiBzcGFyc2U6IHNwYXJzZTogaW5jb3JyZWN0IHR5
cGUgaW4gYXJndW1lbnQgMSAoZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzKSBAQCAgICAgZXhw
ZWN0ZWQgdm9pZCAqIEBAICAgICBnb3QgdW5zaWduZWQgY2hhciBbbm9kZXJlZl0gW3VzZXJ0
eXBlXSBfX2lvbWVtICpbYXNzaWduZWRdIGRzdCBAQA0KPiAgICAgZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL2ZiX2NmYl9mb3BzLmM6MTEzOjMyOiBzcGFyc2U6ICAgICBleHBlY3RlZCB2
b2lkICoNCj4gICAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9jZmJfZm9wcy5jOjEx
MzozMjogc3BhcnNlOiAgICAgZ290IHVuc2lnbmVkIGNoYXIgW25vZGVyZWZdIFt1c2VydHlw
ZV0gX19pb21lbSAqW2Fzc2lnbmVkXSBkc3QNCj4gDQo+IHZpbSArNDQgZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZiX2NmYl9mb3BzLmMNCj4gDQo+ICAgICAgIDYJDQo+ICAgICAgIDcJ
c3NpemVfdCBmYl9jZmJfcmVhZChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY2hhciBfX3VzZXIg
KmJ1Ziwgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+ICAgICAgIDgJew0KPiAgICAg
ICA5CQl1bnNpZ25lZCBsb25nIHAgPSAqcHBvczsNCj4gICAgICAxMAkJdTggKmJ1ZmZlciwg
KmRzdDsNCj4gICAgICAxMQkJdTggX19pb21lbSAqc3JjOw0KPiAgICAgIDEyCQlpbnQgYywg
Y250ID0gMCwgZXJyID0gMDsNCj4gICAgICAxMwkJdW5zaWduZWQgbG9uZyB0b3RhbF9zaXpl
Ow0KPiAgICAgIDE0CQ0KPiAgICAgIDE1CQlpZiAoIWluZm8tPnNjcmVlbl9iYXNlKQ0KPiAg
ICAgIDE2CQkJcmV0dXJuIC1FTk9ERVY7DQo+ICAgICAgMTcJDQo+ICAgICAgMTgJCXRvdGFs
X3NpemUgPSBpbmZvLT5zY3JlZW5fc2l6ZTsNCj4gICAgICAxOQkNCj4gICAgICAyMAkJaWYg
KHRvdGFsX3NpemUgPT0gMCkNCj4gICAgICAyMQkJCXRvdGFsX3NpemUgPSBpbmZvLT5maXgu
c21lbV9sZW47DQo+ICAgICAgMjIJDQo+ICAgICAgMjMJCWlmIChwID49IHRvdGFsX3NpemUp
DQo+ICAgICAgMjQJCQlyZXR1cm4gMDsNCj4gICAgICAyNQkNCj4gICAgICAyNgkJaWYgKGNv
dW50ID49IHRvdGFsX3NpemUpDQo+ICAgICAgMjcJCQljb3VudCA9IHRvdGFsX3NpemU7DQo+
ICAgICAgMjgJDQo+ICAgICAgMjkJCWlmIChjb3VudCArIHAgPiB0b3RhbF9zaXplKQ0KPiAg
ICAgIDMwCQkJY291bnQgPSB0b3RhbF9zaXplIC0gcDsNCj4gICAgICAzMQkNCj4gICAgICAz
MgkJYnVmZmVyID0ga21hbGxvYygoY291bnQgPiBQQUdFX1NJWkUpID8gUEFHRV9TSVpFIDog
Y291bnQsIEdGUF9LRVJORUwpOw0KPiAgICAgIDMzCQlpZiAoIWJ1ZmZlcikNCj4gICAgICAz
NAkJCXJldHVybiAtRU5PTUVNOw0KPiAgICAgIDM1CQ0KPiAgICAgIDM2CQlzcmMgPSAodTgg
X19pb21lbSAqKShpbmZvLT5zY3JlZW5fYmFzZSArIHApOw0KPiAgICAgIDM3CQ0KPiAgICAg
IDM4CQlpZiAoaW5mby0+ZmJvcHMtPmZiX3N5bmMpDQo+ICAgICAgMzkJCQlpbmZvLT5mYm9w
cy0+ZmJfc3luYyhpbmZvKTsNCj4gICAgICA0MAkNCj4gICAgICA0MQkJd2hpbGUgKGNvdW50
KSB7DQo+ICAgICAgNDIJCQljICA9IChjb3VudCA+IFBBR0VfU0laRSkgPyBQQUdFX1NJWkUg
OiBjb3VudDsNCj4gICAgICA0MwkJCWRzdCA9IGJ1ZmZlcjsNCj4gICAgPiA0NAkJCWZiX21l
bWNweV9mcm9tZmIoZHN0LCBzcmMsIGMpOw0KPiAgICAgIDQ1CQkJZHN0ICs9IGM7DQo+ICAg
ICAgNDYJCQlzcmMgKz0gYzsNCj4gICAgICA0NwkNCj4gICAgICA0OAkJCWlmIChjb3B5X3Rv
X3VzZXIoYnVmLCBidWZmZXIsIGMpKSB7DQo+ICAgICAgNDkJCQkJZXJyID0gLUVGQVVMVDsN
Cj4gICAgICA1MAkJCQlicmVhazsNCj4gICAgICA1MQkJCX0NCj4gICAgICA1MgkJCSpwcG9z
ICs9IGM7DQo+ICAgICAgNTMJCQlidWYgKz0gYzsNCj4gICAgICA1NAkJCWNudCArPSBjOw0K
PiAgICAgIDU1CQkJY291bnQgLT0gYzsNCj4gICAgICA1NgkJfQ0KPiAgICAgIDU3CQ0KPiAg
ICAgIDU4CQlrZnJlZShidWZmZXIpOw0KPiAgICAgIDU5CQ0KPiAgICAgIDYwCQlyZXR1cm4g
Y250ID8gY250IDogZXJyOw0KPiAgICAgIDYxCX0NCj4gICAgICA2MglFWFBPUlRfU1lNQk9M
KGZiX2NmYl9yZWFkKTsNCj4gICAgICA2MwkNCj4gICAgICA2NAlzc2l6ZV90IGZiX2NmYl93
cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY29uc3QgY2hhciBfX3VzZXIgKmJ1Ziwgc2l6
ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+ICAgICAgNjUJew0KPiAgICAgIDY2CQl1bnNp
Z25lZCBsb25nIHAgPSAqcHBvczsNCj4gICAgICA2NwkJdTggKmJ1ZmZlciwgKnNyYzsNCj4g
ICAgICA2OAkJdTggX19pb21lbSAqZHN0Ow0KPiAgICAgIDY5CQlpbnQgYywgY250ID0gMCwg
ZXJyID0gMDsNCj4gICAgICA3MAkJdW5zaWduZWQgbG9uZyB0b3RhbF9zaXplOw0KPiAgICAg
IDcxCQ0KPiAgICAgIDcyCQlpZiAoIWluZm8tPnNjcmVlbl9iYXNlKQ0KPiAgICAgIDczCQkJ
cmV0dXJuIC1FTk9ERVY7DQo+ICAgICAgNzQJDQo+ICAgICAgNzUJCXRvdGFsX3NpemUgPSBp
bmZvLT5zY3JlZW5fc2l6ZTsNCj4gICAgICA3NgkNCj4gICAgICA3NwkJaWYgKHRvdGFsX3Np
emUgPT0gMCkNCj4gICAgICA3OAkJCXRvdGFsX3NpemUgPSBpbmZvLT5maXguc21lbV9sZW47
DQo+ICAgICAgNzkJDQo+ICAgICAgODAJCWlmIChwID4gdG90YWxfc2l6ZSkNCj4gICAgICA4
MQkJCXJldHVybiAtRUZCSUc7DQo+ICAgICAgODIJDQo+ICAgICAgODMJCWlmIChjb3VudCA+
IHRvdGFsX3NpemUpIHsNCj4gICAgICA4NAkJCWVyciA9IC1FRkJJRzsNCj4gICAgICA4NQkJ
CWNvdW50ID0gdG90YWxfc2l6ZTsNCj4gICAgICA4NgkJfQ0KPiAgICAgIDg3CQ0KPiAgICAg
IDg4CQlpZiAoY291bnQgKyBwID4gdG90YWxfc2l6ZSkgew0KPiAgICAgIDg5CQkJaWYgKCFl
cnIpDQo+ICAgICAgOTAJCQkJZXJyID0gLUVOT1NQQzsNCj4gICAgICA5MQkNCj4gICAgICA5
MgkJCWNvdW50ID0gdG90YWxfc2l6ZSAtIHA7DQo+ICAgICAgOTMJCX0NCj4gICAgICA5NAkN
Cj4gICAgICA5NQkJYnVmZmVyID0ga21hbGxvYygoY291bnQgPiBQQUdFX1NJWkUpID8gUEFH
RV9TSVpFIDogY291bnQsIEdGUF9LRVJORUwpOw0KPiAgICAgIDk2CQlpZiAoIWJ1ZmZlcikN
Cj4gICAgICA5NwkJCXJldHVybiAtRU5PTUVNOw0KPiAgICAgIDk4CQ0KPiAgICAgIDk5CQlk
c3QgPSAodTggX19pb21lbSAqKShpbmZvLT5zY3JlZW5fYmFzZSArIHApOw0KPiAgICAgMTAw
CQ0KPiAgICAgMTAxCQlpZiAoaW5mby0+ZmJvcHMtPmZiX3N5bmMpDQo+ICAgICAxMDIJCQlp
bmZvLT5mYm9wcy0+ZmJfc3luYyhpbmZvKTsNCj4gICAgIDEwMwkNCj4gICAgIDEwNAkJd2hp
bGUgKGNvdW50KSB7DQo+ICAgICAxMDUJCQljID0gKGNvdW50ID4gUEFHRV9TSVpFKSA/IFBB
R0VfU0laRSA6IGNvdW50Ow0KPiAgICAgMTA2CQkJc3JjID0gYnVmZmVyOw0KPiAgICAgMTA3
CQ0KPiAgICAgMTA4CQkJaWYgKGNvcHlfZnJvbV91c2VyKHNyYywgYnVmLCBjKSkgew0KPiAg
ICAgMTA5CQkJCWVyciA9IC1FRkFVTFQ7DQo+ICAgICAxMTAJCQkJYnJlYWs7DQo+ICAgICAx
MTEJCQl9DQo+ICAgICAxMTIJDQo+ICAgPiAxMTMJCQlmYl9tZW1jcHlfdG9mYihkc3QsIHNy
YywgYyk7DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5r
ZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2
LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIg
MzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------DFJl0tM9GVK0ppaU8oCajf0P--

--------------xYnq0JUGXa0tEBYwb6wV4okH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRJNAYFAwAAAAAACgkQlh/E3EQov+Cc
xA/+L0YyVP3khi/27pqCiQ4ASaULLZnmgSdBgtuREZpwp6rV5zwCsWsLoCiwEmVJGneQ6L1bSzBa
259ZZLwhWy5fTEJKV5BfuQWrrtNoSR0l01SRM1blayElwc21bZAFKaKCzcyb4HcjmUwQq6kObg5/
8JqOgHD8tFKiEryZjuRy3AaNzSAPdmn6JMh781M7Aqp32iqXJAKcmbX90jiD9zJSmo1piJvp8I1I
Ovp/6gDqkpB78vAnVu0VXNOdRid17dqZhp1pxvzHskUtcFuC9AUWKMlDxcZBQQAkhKriDaZRBY6s
540YIEGUIOgJW/JyU5sPabtQrOI9u4zGJFvldGqsxAmT4gRIKD8Bf2LCXThMmfJ4zqG4dk5fDQRr
SXvIQj4xDVPrCKUWtvNDUDn8MabIFoeJGcu9g8pl01nMvWMc9L2Z+8xbQm8RJjxoq1oHHpn07/pl
Bzwq83icXx3h/nHM0GDsGMaucGjI83HWAUYdWLdc95k2Ei9QSYeL3Uf+GUe12QCHlS7J1JYJxT6d
X7S6xMI/Q53oabqKxNYVn/bynKEYz6eLSTtclqbN444Lv1GUuL9EB0n0dhpFbOq2JZYUSKiWf6+J
1NQG1xqemD3cIDVWPfMJlgAvqsjPV1sor2rEEHztwqXWqyakRcKAQN5K7IxbNm4cnCdmjYZ5FNMw
gIQ=
=HHVv
-----END PGP SIGNATURE-----

--------------xYnq0JUGXa0tEBYwb6wV4okH--
