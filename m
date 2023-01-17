Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5910B66E77E
	for <lists+linux-fbdev@lfdr.de>; Tue, 17 Jan 2023 21:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbjAQUKa (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 17 Jan 2023 15:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234620AbjAQUHS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 17 Jan 2023 15:07:18 -0500
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAE14391E
        for <linux-fbdev@vger.kernel.org>; Tue, 17 Jan 2023 11:01:24 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-15b9c93848dso24718153fac.1
        for <linux-fbdev@vger.kernel.org>; Tue, 17 Jan 2023 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OgaymgAXi9Z6g6pYwBOzM02/P477EqWitgDVTE3LFbU=;
        b=7UFMvbpKkJyjWVLlq6ctk0nXiLL3RrLgvGqk+/g8pD0wAzMEFNodkoMNXxSPAzvJye
         T4nqVDpRCF5Pkw4fe0ROrd1BjE8DZbycDcUSRlgnihtqJaZkkqELJ7TzEZYyPHojRNxM
         MBh6YZCgcmJgLXwboxe3bvrjmez4qHhfCRIxGuc2G0+QOOJ/eKT38XBZ7MfSSmNLVm7z
         gDt6C3Ymsnj+eKLcMZ0dj5q2KFKnZutgcY/1C6+IgeLmT5DwAU4QsUhG6TCQdnlD6nEb
         fYtWfawIuB6wYahQA/cq89ISwAR2GZXbrrCFpCVxRJqHc9Mn337ID3jg/QgfKjbyHIu6
         BObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgaymgAXi9Z6g6pYwBOzM02/P477EqWitgDVTE3LFbU=;
        b=0OjpGC0+JBo+gjzxD+xBgnh650LtiKmlu4LUzVDDnhjLsLwvlHfxb4w5cMnzeTu5Fn
         6bJhyrDB5ZH1dZdIf3lp7Lsj2RfTBYNPIFXGmlD5QP251nTFb1Zb3jzpeavWQcoRzal6
         O1/xMr/j95fWk0mg4MyvxcBpg/KeGVLzXGJnNuXp8LAgdbRTlnuquCTD6YwWeWEp+JD4
         ckbvOds+Fm+iDOFyDSDRY9heUAyS0hHHjtWvO2IOuPwRChokA+KflBCftrDPHJYPKCeJ
         Ewlc3Kj3FKVqug8x2uEtUY+1KSuLd6a7rXdcS/dlCQV5HhrMOV4uPu6jSG6TrLSiYLJZ
         D/1w==
X-Gm-Message-State: AFqh2kpahN8Wgg35GIU8XUz4kQ1a1cKEtJDfWVUpmfHgrLGqZBf4MOBv
        VNor+Py3R7K0bpbezBEEr3SIQw==
X-Google-Smtp-Source: AMrXdXsgzCxMhqm+bb3il7EsJjEv0NbGPCzT1qf9VREFYRxVllxrk/YEzaFAyrBdtefAaDgGfnk/UQ==
X-Received: by 2002:a05:6870:c190:b0:15e:cfca:b312 with SMTP id h16-20020a056870c19000b0015ecfcab312mr2807015oad.52.1673982083592;
        Tue, 17 Jan 2023 11:01:23 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
        by smtp.gmail.com with ESMTPSA id r18-20020a05687080d200b0012763819bcasm16664335oab.50.2023.01.17.11.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 11:01:22 -0800 (PST)
Message-ID: <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
Date:   Tue, 17 Jan 2023 13:13:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
        dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-sh@vger.kernel.org
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
From:   Rob Landley <rob@landley.net>
In-Reply-To: <20230116071306.GA15848@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 1/16/23 01:13, Christoph Hellwig wrote:
> On Fri, Jan 13, 2023 at 09:09:52AM +0100, John Paul Adrian Glaubitz wrote:
>> I'm still maintaining and using this port in Debian.
>>
>> It's a bit disappointing that people keep hammering on it. It works fine for me.
> 
> What platforms do you (or your users) use it on?

3 j-core boards, two sh4 boards (the sh7760 one I patched the kernel of), and an
sh4 emulator.

I have multiple j-core systems (sh2 compatible with extensions, nommu, 3
different kinds of boards running it here). There's an existing mmu version of
j-core that's sh3 flavored but they want to redo it so it hasn't been publicly
released yet, I have yet to get that to run Linux because the mmu code would
need adapting, but the most recent customer projects were on the existing nommu
SOC, as was last year's ASIC work via sky130.

My physical sh4 boards are a Johnson Controls N40 (sh7760 chipset) and the
little blue one is... sh4a I think? (It can run the same userspace, I haven't
replaced that board's kernel since I got it, I think it's the type Glaubitz is
using? It's mostly in case he had an issue I couldn't reproduce on different
hardware, or if I spill something on my N40.)

I also have a physical sh2 board on the shelf which I haven't touched in years
(used to comparison test during j2 development, and then the j2 boards replaced it).

I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
really convenient: neither of my physical boards boot from SD card so replacing
the kernel requires reflashing soldered in flash. (They'll net mount userspace
but I haven't gotten either bootloader to net-boot a kernel.)

I include sh4 in the my mkroot builds each toybox release, I have a ~300 line
bash script that builds bootable toybox systems for a dozen-ish architectures,
including building a kernel configured to run under qemu:

  https://github.com/landley/toybox/blob/master/scripts/mkroot.sh

And I ship the resulting bootable system images, most recent release is at:

  https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/

As described at:

  http://landley.net/toybox/faq.html#mkroot

Various people in Japan have more hardware, but I haven't made it physically
back there since 2020. (My residency card expired during the pandemic.)

Rob
