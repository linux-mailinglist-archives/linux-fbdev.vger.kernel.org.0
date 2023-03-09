Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7F76B23DE
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Mar 2023 13:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjCIMQO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Mar 2023 07:16:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjCIMQG (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Mar 2023 07:16:06 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FD5EABB1;
        Thu,  9 Mar 2023 04:15:52 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2F3A721C46;
        Thu,  9 Mar 2023 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678364151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T6d0mfEWoU7ehUj1+7+GbMa7Q18xp8CCOW6idolWJhg=;
        b=ZKRY48pyCuIoFJrNrq9CF51wtOXDKeJB/gu9FHOdFLBrSU9JRyk7yRB20rEVY2nspvmuzW
        LI75wG/vhgVQZtbp36rmIFmBwIHJidz7vntzzukkIoM3E4MQ0xE9vbkZGrFkTyRCOsWJu1
        daR6+fF/sh+mCX0JRRFpNIg1or0rd7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678364151;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T6d0mfEWoU7ehUj1+7+GbMa7Q18xp8CCOW6idolWJhg=;
        b=jIA4cgMzL5lnLel/QnFPLh3dXrBGHRFdATI/6YObYmhxacDvMMw+OH9rUYpIUV7QghOe9Z
        Xi6kMxCAJ3FtrKAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C050D13A10;
        Thu,  9 Mar 2023 12:15:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Z8L4LfbNCWTRagAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 12:15:50 +0000
Message-ID: <1b599122-5e23-b5a8-054d-80c2d939a710@suse.de>
Date:   Thu, 9 Mar 2023 13:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 22/99] fbdev/fsl-diu-fb: Duplicate video-mode option
 string
To:     Timur Tabi <timur@kernel.org>
Cc:     deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
        linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
        thomas@winischhofer.net, James.Bottomley@hansenpartnership.com,
        spock@gentoo.org, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com, geert+renesas@glider.be,
        corbet@lwn.net, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-23-tzimmermann@suse.de>
 <CAOZdJXUtkyg5Gv3HYCK-U1pQpY0_QBk99wtqUvz5RVy2W3Ak9w@mail.gmail.com>
 <aac88d8e-52e8-e2d5-2f41-bed7886bb3dc@suse.de>
 <CAOZdJXWGNBHMPRmkBYeVL31=Q0Y=fLa8RG0KS668xQ9ozD+Xtg@mail.gmail.com>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAOZdJXWGNBHMPRmkBYeVL31=Q0Y=fLa8RG0KS668xQ9ozD+Xtg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KfkvwXAsm6zC4C56bmHFiANz"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KfkvwXAsm6zC4C56bmHFiANz
Content-Type: multipart/mixed; boundary="------------3eJ0L1XqQTgWKfL9INWDNoxp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Timur Tabi <timur@kernel.org>
Cc: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <1b599122-5e23-b5a8-054d-80c2d939a710@suse.de>
Subject: Re: [PATCH 22/99] fbdev/fsl-diu-fb: Duplicate video-mode option
 string
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-23-tzimmermann@suse.de>
 <CAOZdJXUtkyg5Gv3HYCK-U1pQpY0_QBk99wtqUvz5RVy2W3Ak9w@mail.gmail.com>
 <aac88d8e-52e8-e2d5-2f41-bed7886bb3dc@suse.de>
 <CAOZdJXWGNBHMPRmkBYeVL31=Q0Y=fLa8RG0KS668xQ9ozD+Xtg@mail.gmail.com>
In-Reply-To: <CAOZdJXWGNBHMPRmkBYeVL31=Q0Y=fLa8RG0KS668xQ9ozD+Xtg@mail.gmail.com>

--------------3eJ0L1XqQTgWKfL9INWDNoxp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDMuMjMgdW0gMTc6MjYgc2NocmllYiBUaW11ciBUYWJpOg0KPiBPbiBU
dWUsIE1hciA3LCAyMDIzIGF0IDI6MjjigK9BTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pj4gU28gYWZ0ZXIgbW9kdWxlX2luaXQgaXMgZmlu
aXNoZWQsIG1vZGVfb3B0aW9uX2J1ZltdIG5vIGxvbmdlciBleGlzdHM/DQo+Pg0KPj4gRG9l
cyB0aGUgX19pbml0IGF0dHJpYnV0ZSBvbiBhIGZ1bmN0aW9uIGFmZmVjdCB0aGUgc3RhdGlj
IHZhcmlhYmxlcyBpbg0KPj4gdGhhdCBmdW5jdGlvbj8NCj4gDQo+IFRoYXQgaXMgYW4gZXhj
ZWxsZW50IHF1ZXN0aW9uLg0KPiANCj4gaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9xdWVz
dGlvbnMvNjQ1NTg2MTQvd2hhdC1oYXBwZW5zLXRvLWxvY2FsLXN0YXRpYy1pZGVudGlmaWVy
cy1pbi1pbml0LWZ1bmN0aW9uDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoZSBjb21waWxlciBp
cyBuYXR1cmFsbHkgYXdhcmUgb2Ygd2hhdGV2ZXIgc2VjdGlvbiBhDQo+IHZhcmlhYmxlIG9y
IGZ1bmN0aW9uIGlzIHBsYWNlZCBpbiwgc28gaXQgY2FuJ3QgcmVhbGx5IGtub3cgdGhhdA0K
PiBtb2RlX29wdGlvbl9idWZbXSBpcyBzdXBwb3NlIHRvIGhhdmUgYSBsaW1pdGVkIGxpZmV0
aW1lLg0KPiANCj4gRWl0aGVyIHdheSwgdGhlIGNvZGUgc2VlbXMgd3JvbmcuICBJZiBtb2Rl
X29wdGlvbl9idWZbXSBpcyBtYXJrZWQgYXMNCj4gX19pbml0ZGF0YSwgdGhlbiBpdCB3aWxs
IGRpc2FwcGVhciBiZWZvcmUgdGhlIHByb2JlKCkgZnVuY3Rpb24gaXMNCj4gY2FsbGVkLg0K
PiANCj4gSWYgbW9kZV9vcHRpb25fYnVmW10gcmVtYWlucyByZXNpZGVudCwgdGhlbiB3ZSBh
cmUgd2FzdGluZyAyNTYgYnl0ZXMuDQoNCkknbSBwcmVwYXJpbmcgYW4gdXBkYXRlIHRvIHRo
aXMgc2VyaWVzLiBUaGUgc3RyaW5nIHdpbGwgYmUgYWxsb2NhdGVkIGFuZCANCmZyZWVkIHdp
dGgga3N0cmR1cCgpIGFuZCBrZnJlZSgpLiBTbyB0aGVzZSBpc3N1ZXMgc2hvdWxkIGJlIHJl
c29sdmVkIHRoZW4uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------3eJ0L1XqQTgWKfL9INWDNoxp--

--------------KfkvwXAsm6zC4C56bmHFiANz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQJzfYFAwAAAAAACgkQlh/E3EQov+Dr
bA//eu0F5YkgKXiqCN5mDzjx0Vetejr5RsDzTifLbMwjsO55eVEkb10ANH24L1T2li0D7lXdLKm0
ODz0e0qMKpK6rIAN6RumFcHJymnuyxuuktiiUTWJJkQe6uE32CqA9M7qCB/ERaQOEKuYPybQh8lB
I12HhlRtXULvKiUn7SHhP5sUOWHvIotmbshoiPlaM/O9fghqOOPzZe8K/VWmXQES82vyMFBLkaM/
H1bSjZDPKBAxKgubfYrd0HohnXJY1DL2bYBfTpQTtJDsbwsEKJzgAEZ70TChiuYhEpDGvpe7n0+I
Uw+Fcb8uZoyy6Gjr8aJBKsSrpl4uV1sc4ddGxt34KK+DSX+mmpG314n7NZMhRNcjDdfcwinAapOH
Tyi0nLTWxpa4mD+sQ/NfjzbeHekt8BgF0A1Fdn4ChIVVFo6w7tFa6Wt88+tgnhS0gga+TkQROXfg
k2sCLyxxhejL6o0yaBFGWqBXdRTZX6UHNkJyzbNrPtLrE7Ztx5veNRZNfzAG05NKGvHWHm1Ey2y0
twLiqwguQY5fxOeXsOR148JqrdqDL0W+BYb7U3SHPP9Ceyt2N68b0v3BnVwN58MhABgkl4HzIsAv
oWzjnBOo+ULyL+nsylrKR6XrhijPpzO9bkKpATn/RjDVIvgkub0DXca5b7dXgQun5uojNolWPIjM
5GI=
=6ba6
-----END PGP SIGNATURE-----

--------------KfkvwXAsm6zC4C56bmHFiANz--
