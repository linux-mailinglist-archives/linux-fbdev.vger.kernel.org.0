Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED70E6EF617
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Apr 2023 16:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241273AbjDZOOl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Apr 2023 10:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241258AbjDZOOj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Apr 2023 10:14:39 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DE16A52
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Apr 2023 07:14:35 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 3EA12211AE;
        Wed, 26 Apr 2023 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1682518468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g9yW+6h0IPG1ry3IP+ZzPXAqcZp2lzFY6ldTzoGOOwY=;
        b=vIH/xoG2nRJBAj4vuLh17xig/1MlcISJAc6T18JuuKgcdauTWoiKPl2oQga+WZYFIyiwOR
        TpIK5nakxwqAtaSrIQ/nDw4D6oKSnmvvyn/D5/2j1zcy3ykblDH56AXu1D+hx0mCIXb+KT
        MMVf8Od6nW5hLrmutSSNMpF9g4kis4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1682518468;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g9yW+6h0IPG1ry3IP+ZzPXAqcZp2lzFY6ldTzoGOOwY=;
        b=xUJgIJH6I8/iHlJW4/VzZO0ikoRKf2eU7neM95gw2e1D/kxmX3ByTJozL+mUAlW/6vkqII
        Q5XZ4XahMFtPeRCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0764313421;
        Wed, 26 Apr 2023 14:14:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id r/HGAMQxSWRxWAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 14:14:28 +0000
Message-ID: <23bcbfa9-980c-66a2-5b2c-3476b13d83b0@suse.de>
Date:   Wed, 26 Apr 2023 16:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/6] fbdev: Use screen_buffer in fb_sys_{read,write}()
Content-Language: en-US
To:     Javier Martinez Canillas <javierm@redhat.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch, deller@gmx.de,
        geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-3-tzimmermann@suse.de>
 <87a5yvj4wl.fsf@minerva.mail-host-address-is-not-set>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87a5yvj4wl.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8I5qFuqXe09XWMjzz40CdFtR"
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8I5qFuqXe09XWMjzz40CdFtR
Content-Type: multipart/mixed; boundary="------------WlRMICZ2lUj8OMt1HNjt174s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <23bcbfa9-980c-66a2-5b2c-3476b13d83b0@suse.de>
Subject: Re: [PATCH 2/6] fbdev: Use screen_buffer in fb_sys_{read,write}()
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-3-tzimmermann@suse.de>
 <87a5yvj4wl.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87a5yvj4wl.fsf@minerva.mail-host-address-is-not-set>

--------------WlRMICZ2lUj8OMt1HNjt174s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDQuMjMgdW0gMTg6MzUgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gVXNlIGluZm8tPnNjcmVlbl9idWZmZXIgd2hlbiByZWFkaW5nIGFuZCB3
cml0aW5nIGZyYW1lYnVmZmVycyBpbg0KPj4gc3lzdGVtIG1lbW9yeS4gSXQncyB0aGUgY29y
cmVjdCBwb2ludGVyIGZvciB0aGlzIGFkZHJlc3Mgc3BhY2UuDQo+Pg0KPiANCj4gTWF5YmUg
Y2FuIGV4cGFuZCB0aGUgZXhwbGFuYXRpb24gYSBsaXR0bGUgYml0IHdpdGggc29tZXRoaW5n
IGxpa2UgdGhpcz8NCj4gDQo+ICJUaGUgc3RydWN0IGZiX2luZm8gaGFzIGEgdW5pb24gdG8g
c3RvcmUgdGhlIGZyYW1lYnVmZmVyIG1lbW9yeS4gVGhpcyBjYW4NCj4gZWl0aGVyIGJlIGlu
Zm8tPnNjcmVlbl9iYXNlIGlmIHRoZSBmcmFtZWJ1ZmZlciBpcyBzdG9yZWQgaW4gSS9PIG1l
bW9yeSwNCj4gb3IgaW5mby0+c2NyZWVuX2J1ZmZlciBpZiB0aGUgZnJhbWVidWZmZXIgaXMg
c3RvcmVkIGluIHN5c3RlbSBtZW1vcnkuDQo+IA0KPiBTaW5jZSB0aGUgZmJfc3lzX3tyZWFk
LHdyaXRlfSgpIGZ1bmN0aW9ucyBvcGVyYXRlIG9uIHRoZSBsYXR0ZXIgYWRkcmVzcw0KPiBz
cGFjZSwgaXQgaXMgd3JvbmcgdG8gdXNlIC5zY3JlZW5fYmFzZSBhbmQgLnNjcmVlbl9idWZm
ZXIgbXVzdCBiZSB1c2VkDQo+IGluc3RlYWQuIFRoaXMgYWxzbyBnZXQgcmlkcyBvZiBhbGwg
dGhlIGNhc3RpbmcgbmVlZGVkIGR1ZSBub3QgdXNpbmcgdGhlDQo+IGNvcnJlY3QgZGF0YSB0
eXBlLiINCg0KVGhhbmtzLiBJJ2xsIGFkZCB0aGlzIHRleHQgYXMtaXMgaW4gdGhlIG5leHQg
aXRlcmF0aW9uLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0N
Cj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1A
cmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
RnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8g
VG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4N
CkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------WlRMICZ2lUj8OMt1HNjt174s--

--------------8I5qFuqXe09XWMjzz40CdFtR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRJMcMFAwAAAAAACgkQlh/E3EQov+BL
4w/8CQ2Q8mUDTlxw5fGeO3qEAUIl8HGsUPNp17zC3jM8q50ynRF+k1Ho5oUd7bvoVHl5YwXRnTJw
OnKPw7mkCrGtv2+yZUuZ6CQmDOIGGdI/K3YZqmc9knqJ9XctJ0UgKzb/xLtqav4dHsOvKXmN49RT
ZXoETmBY5k9x3BH4Imkq3HZOJvKMKS2FGcdC4LqGLAzHf/Wd2VpjKyK9S3ueQ3svsJxDWQREOf0Z
4jLXAoViWUbMLaTmL84Ac8agmASHvTVfuLcPLkwuvS07pAq3W0Nx8kwdH3yfk/QgKsb2vmYk72AD
c8g8+oGPhpttbhB3KBTrsWVqd8fPCBSlnPS81eZHkh6fvAGoyIqLBISxSUcvKWM15gmKJmSDYAeN
h3gZRiIqAxBWiX6fLMZNY8U2Znoj8hqrbZBNOqhKR0xvzoGuwnWtU0THwEgkqY+6268P0L1+1RZC
8jhjdhbqbKM5k0w2KDByUOqMGkK7GBTpVDY0kQJt4Vsm/KexIHRSIJ0fv9SnPEb4yHS4eXnFqwWk
SYhZjLEsh3AQ1aZXTCTOZ4wv0jZeqZCxCA9iHsVZT0Bo5E5sc4r/r81PM8zGpYr5bk3IAphwmo2Q
A8QYTYXRS648Pp1pIUJpm8yWAlBTEl5kaTgLVK7lhxMqKi3Thhu69qNA79GBl01DRJUFUJhoVyTE
Mto=
=hXBJ
-----END PGP SIGNATURE-----

--------------8I5qFuqXe09XWMjzz40CdFtR--
