Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC64C5FD598
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Oct 2022 09:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiJMHj2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Oct 2022 03:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJMHj1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Oct 2022 03:39:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAD8122BD0
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Oct 2022 00:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665646766;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SxL2Gm5Nvf7A3sd8fkrST2jbFEtQq1oZHcJN0U6gqnU=;
        b=LBist10MeVaUAHVzTp2PURVGqXL0rWhRbW0zKSj5slIQ3haKDw0uHMkFz0fhZi/6niuGHs
        5Ui9OtksCACiHTk6RguZMRqAVgjYy7uEWVBmL78zbd8c5cWqqCJ4V3yXievtP+GL188VMy
        qm2ynb4POvs90Y7PgwdxG5ihQyzbpbU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-pYxkV5ODNQeYPQPjiSgxDA-1; Thu, 13 Oct 2022 03:39:25 -0400
X-MC-Unique: pYxkV5ODNQeYPQPjiSgxDA-1
Received: by mail-wr1-f69.google.com with SMTP id g4-20020adfbc84000000b0022fc417f87cso225709wrh.12
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Oct 2022 00:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxL2Gm5Nvf7A3sd8fkrST2jbFEtQq1oZHcJN0U6gqnU=;
        b=O1FxZ+2Xo+coiif333CcWzeKqsYKprg7VLSF7JFxVMbe9GgsoVGwtoNTQUZTMJJMuV
         8QwmJHTgy8bqNpg+K6q1wjIJ4diPbwmlnCRNq6JCBVv2feihNOiqvhgf/G5gg97IoYpk
         BgS1wkrCxVKnqTNrOFVu3nIORCrrVv3I8OifEqaCyUUqPqPTrsoLpxV5JcqviVdqHVVU
         enGEtzQpCy+8SGTCBhjujzDKwMd0ezs3UQBd1bkxmwch8QcM7eevKYmgZW8u760dn4Jc
         fUgse7qSDAi23jNALh3iKVRi2ob+wlcMH392N5pQYf8hQgSoseTj7TyhpZ7KlDx0uxQy
         1U0A==
X-Gm-Message-State: ACrzQf2JLkcuEUKMcNIpw6GfTNiC+EnE2oDaJh6l9vX6h6f9jS/1LNnr
        Sx9jPcYWK15hKiOlDo8lyFNBRJa36QADLHCaE/N1xys5RP4bZFWw0Nwdic4FoRFhfbYY3nCHHjh
        RSzBAeeHNI+B+r3FZ3I88H68=
X-Received: by 2002:adf:a40c:0:b0:22e:47fe:7ea3 with SMTP id d12-20020adfa40c000000b0022e47fe7ea3mr19557221wra.248.1665646763678;
        Thu, 13 Oct 2022 00:39:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5KMxO3Yw68jgmaoO2Rl19Ndp0XdvFGPmI3mYt2GmovFka1lcVoPsM/CwVUy1TT0FzKmzx5lw==
X-Received: by 2002:adf:a40c:0:b0:22e:47fe:7ea3 with SMTP id d12-20020adfa40c000000b0022e47fe7ea3mr19557212wra.248.1665646763475;
        Thu, 13 Oct 2022 00:39:23 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id a14-20020a5d456e000000b0022ccae2fa62sm1423311wrc.22.2022.10.13.00.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 00:39:22 -0700 (PDT)
Message-ID: <de796dba-1e75-e5a8-a908-f0aed4e01fec@redhat.com>
Date:   Thu, 13 Oct 2022 09:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Content-Language: en-US
To:     =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
        Maxime Ripard <maxime@cerno.tech>, sam@ravnborg.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        benh@kernel.crashing.org, Paul Mackerras <paulus@samba.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        mark.cave-ayland@ilande.co.uk, linux-fbdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
References: <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
 <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
 <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
 <20221012142707.GD28810@kitsune.suse.cz>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221012142707.GD28810@kitsune.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello,

On 10/12/22 16:27, Michal Suchánek wrote:

[...]

>>
>> If you are using the framebuffer code from vga.c, I would guess that
>> that you can run a big-endian kernel with qemu-system-ppc64,
>> or a little-endian kernel with qemu-system-ppc64le and get the
>> correct colors, while running a little-endian kernel with
>> qemu-system-ppc64 and vga.c, or using a different framebuffer
>> emulation on a big-endian kernel would give you the wrong colors.
> 
> Thanks for digging this up.
> 
> That makes one thing clear: qemu does not emulate this framebuffer
> property correctly, and cannot be relied on for verification.
> 
> If you can provide test results from real hardware that show the current
> logic as flawed it should be changed.
> 
> In absence of such test results I think the most reasonable thing is to
> keep the logic that nobody complained about for 10+ years.
> 

I agree with Michal and Thomas on this. I don't see a strong reason to not
use the same heuristic that the offb fbdev driver has been doing for this.

Otherwise if this turns out to be needed, it will cause a regression for a
user that switches to this driver instead. Specially since both fbdev and
DRM drivers match against the same "display" OF compatible string.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

