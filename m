Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED298790467
	for <lists+linux-fbdev@lfdr.de>; Sat,  2 Sep 2023 02:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbjIBACP (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 1 Sep 2023 20:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjIBACP (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 1 Sep 2023 20:02:15 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1131705;
        Fri,  1 Sep 2023 17:02:06 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bee82fad0fso20430225ad.2;
        Fri, 01 Sep 2023 17:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693612926; x=1694217726; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBHir4fqlkZjATOANvJTnaRzDFazZQGgXDcHwsUpUF8=;
        b=S/tsnNCxOvao9PTt/31JKjkx4YDCiqqmFhdfL+CQa6uwqv8aYuXZuRj2VWGZSIna/R
         SVaAvarZO8QzV+a+hAHqrsDzN5lR4t5ab4KqcvAewm++xyKHqZ9SJnKjlM3G19rznjba
         1HHJ8+2lMnPHlKI0HoOzYi7lc52fO8S+3ks3koJobb5DiPJ2899WQ95hY9G7s0svMHFP
         CTOURj1HUYPNm0K1x5oZneLxrVhnTmgOPD+hxj6I4tDrthkr4ZiWcXLhkLu5YZBsd2ix
         KgVDbzs8iQTtzbgi9uvDY8CNinjnJy9gGe8yn9f8G/Sx2uKJ+m5EMshXiWhpkQF8uyR8
         Sb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693612926; x=1694217726;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBHir4fqlkZjATOANvJTnaRzDFazZQGgXDcHwsUpUF8=;
        b=AyaR9s1DarLZ1dfQKBaMOFrd37RI8vpCIRVkVO5oU74WfQ1HtRVdkiKqsJBO8fUDI+
         a5ABowvEfrRK68pNnZOjdfJqlOJkTkMHr3mJOcxvX+1vu9S+qwUe5to3gWYX8iVDB6pZ
         mUeyJUC1fzQleXXMuiixxmeKnX/i502+ZWTbKXDDCbeSVMN/VBfNIH4SPDRn6B4DrjRn
         qWk1icCfgaMFNZhxJ2tDEFhhLAIlAeH2u0/QiykLVP1pQLvp/KYhzfmJR2NGox5TiiMa
         aiAXG/GFmvH4PMlX8Alu+nQcjhnuRN0pbizOdUOLAcUuDOzZRdeWTWpfIiCowL+2UZHc
         Kthg==
X-Gm-Message-State: AOJu0YzvOn4wbJaGYoU52CGPV3YGxA5F7qLjq2mJMFLC8prIM5uQAj6N
        dZ/nmHa3G8l619Bdg2YIdQE=
X-Google-Smtp-Source: AGHT+IEh7+4d8XZvbhk9lepBKYK0sM8SMFxCscjK63UUSC17NWVSSaJIEv72x/SN81Qx1AJi+qUaGA==
X-Received: by 2002:a17:903:2288:b0:1c0:8bf3:eb15 with SMTP id b8-20020a170903228800b001c08bf3eb15mr5119172plh.30.1693612925681;
        Fri, 01 Sep 2023 17:02:05 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902e9c400b001b86dd825e7sm3512634plk.108.2023.09.01.17.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 17:02:05 -0700 (PDT)
Message-ID: <f8c26878-aabc-7cc9-59a1-3f68bf1d43c1@gmail.com>
Date:   Sat, 2 Sep 2023 07:01:59 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Helge Deller <deller@gmx.de>,
        Alexei Gradinari <alex2grad@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Regressions <regressions@lists.linux.dev>,
        Linux Framebuffer <linux-fbdev@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel version 6.1.50 regression: radeonfb deactivate vga
 console
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Since kernel version 6.1.50 the VGA console stopped working on all HP ProLiant (G6 and G7) servers with [AMD/ATI] ES1000 VGA controller.
> 
> No issue with all kernel version 6.1.X before 6.1.50.
> No issue with the kernel 6.1.50 with the reversed next commit:
> 
> commit 6db53af15444e7022640d7b8d5e7531d94e27a43
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Wed Jan 11 16:41:08 2023 +0100
>     fbdev/radeon: use pci aperture helpers
> 
> With the commit 6db53af15444e7022640d7b8d5e7531d94e27a43 there is kernel log "radeonfb 0000:01:03.0: vgaarb: deactivate vga console" and VGA console not working. Without this commit no such log and VGA console working.
> 
> Equipment:
> HP ProLiant DL360 G7
> 01:03.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] ES1000 (rev 02) (prog-if 00 [VGA controller])
>         Subsystem: Hewlett-Packard Company ProLiant DL360 G5
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping+ SERR+ FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin A routed to IRQ 23
>         Region 0: Memory at e8000000 (32-bit, prefetchable) [size=128M]
>         Region 1: I/O ports at 2000 [size=256]
>         Region 2: Memory at f1cf0000 (32-bit, non-prefetchable) [size=64K]
>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>         Capabilities: [50] Power Management version 2
>                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>         Kernel driver in use: radeonfb
> 
> HP ProLiant ML330 G6
> 01:03.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] ES1000 (rev 02) (prog-if 00 [VGA controller])
>         Subsystem: Hewlett-Packard Company ProLiant DL360 G5
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping+ SERR+ FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin A routed to IRQ 23
>         Region 0: Memory at f0000000 (32-bit, prefetchable) [size=128M]
>         Region 1: I/O ports at 3000 [size=256]
>         Region 2: Memory at fbef0000 (32-bit, non-prefetchable) [size=64K]
>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>         Capabilities: [50] Power Management version 2
>                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>         Kernel driver in use: radeonfb

See Bugzilla for the full thread.

Anyway, I'm adding it to regzbot:

#regzbot introduced: 9b539c4d1b921b https://bugzilla.kernel.org/show_bug.cgi?id=217861
#regzbot title: using pci aperture helpers deactivates AMD ES1000 VGA controller

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217861

-- 
An old man doll... just what I always wanted! - Clara
