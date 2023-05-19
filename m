Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A55709F35
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 May 2023 20:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjESSk7 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 19 May 2023 14:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjESSk6 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 19 May 2023 14:40:58 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977F11A6;
        Fri, 19 May 2023 11:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684521649; i=deller@gmx.de;
        bh=b+2AGrbT2iCTCz3OFlX/jcH1rlY52mlE7sdXnwb37J0=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=D63Jx5htebFUiCuP0eHJDQ2JalzBrzn5N05/n3wXx50DobMiodLI01Czz+IZOdimb
         sPABCBOw+G98zrfJQ0vRIOwdJA0ThcackLAKzoMk8XvA872A4eBFLgm2b8sn+enB2A
         bdcQZIdsdBIgfmmUppiIEbkQzWyi5oR77XxASlNkxRm6nEgoUz8WMsZ0PDkmjPmN3o
         1BU31b2h7BgmsZtUz84Gzl8ngojNNbfG9noSXluxvSeo20f373AdiDMgE1X76gL/q+
         aaZBs+YjSmxx9xCg2/z0yFbSt8TL3EpkXDF0vABxgt6DNB0vAUfb0rK5NScphBI/NQ
         R96s+viwRUSuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.232]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My32F-1qMAzG2kXv-00zaOV; Fri, 19
 May 2023 20:40:49 +0200
Message-ID: <eff05b97-6cf0-7688-15cb-08b5b4d9276f@gmx.de>
Date:   Fri, 19 May 2023 20:40:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in
 dlfb_submit_urb/usb_submit_urb (2)
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>,
        bernie@plugable.com, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <0000000000004a222005fbf00461@google.com>
 <ZGXVANMhn5j/jObU@ls3530>
 <4cd17511-2b60-4c37-baf3-c477cf6d1761@rowland.harvard.edu>
 <be824fbc-cde4-9a2a-8fb4-1ca23f498dca@gmx.de>
 <2905a85f-4a3b-4a4f-b8fb-a4d037d6c591@rowland.harvard.edu>
 <ZGZ3JPLqxCxA2UB6@ls3530>
 <c7b8e69a-cabe-4e17-a511-66179259d1d7@rowland.harvard.edu>
 <6e93305a-2d70-d411-3e36-c536449295dd@gmx.de>
 <c1cf7ff1-c204-4afc-aa9d-890e07d5ec72@rowland.harvard.edu>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <c1cf7ff1-c204-4afc-aa9d-890e07d5ec72@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4OSxPdmlj77MjVIkbZlxVMdcdHlkd7bQa5kIjxoT5UkSSavXw8P
 r/1MvPs6oFo7/9oJ1tZ/vn1qp33N5lgNVmW430/JnQbM/tc142tE8mqtWChgfWHhVTuXa6J
 3at1vK6qbrH/XHrChM5qim8oE5Rx+rXsOCWF6EjbN5mYVpldlNxjQifWTHf3+R+Lm9jZVAo
 MIKOpaxzikMhn1/iRP2sQ==
UI-OutboundReport: notjunk:1;M01:P0:61dTdC5bWHo=;zjMSoS1U0kXpSMcGr82RaoSzznO
 zkG4jMkeN8aPFM7PgBR/hk+wI9KhLRHbV8YUx9/ekIywlmHNk++HbGu0jsvWFsSDqGipt32pT
 b6QrAj29Y6WsDLurgq1udmnbADM+bWp8ad8jcZ1o6mhUAGgw3TUuRPuzgamovQB+n/EX+UsoK
 aAudo94B3OxrJk9feX2NcfIk0bZwbQMY27k0a0ycwLqvplIGXROeo+ayHjFXtA0sXIW8nliXv
 ecR+A/SxjU2906nq0IkMB6XHXTyX6NeCeVEorekGHwdxLflu7h6d8H+gzDROXkM/JNd03BgBM
 eyD+2xQgih2CBo92XGM5AC1oLD4/7Ckk1iFirDBrMErocnDHNYx0F/DPn12Cux3g4n4dojuq1
 JsDL/ZM88cIJA0Dn8x8ETQhGIOajxV4Q4YSNLKI/qEyfnIZVeOSMnBK7Hf/V4qFbfKU1EHUp8
 MrGEezMTRHxqwy4p8v/mLJlpY0L6dFXsEFGbAn+5LNNjgCPUnT5Fhz3wb0E2gKBSnTQYckg/T
 U1Sz9r/4b8Im3q4XlX8Ot2FWdA+fe3I1S1paxvmOGWK0dL48gTfEm9vU2Hqxkgc27XZuBfH4C
 d2DdibSJkVuhJ/CMuBqJlCC7SFHKGEP5F6ogwhTjz7p66tWQcBpQhEcA5bFStsEA6hD/AWojX
 KUXFOY+yhGSJ20ZogQsJqs9ngKRytnEBMMvWypFtiSNNniBCjqwIAd4DgNiADFJ2u8R4p+9vB
 QvO+WCDihnE5g5iivaNYru73VQxzXyxoZdL0BpPa4agv9rKkGZ1kbOqw2e2h7sVcfZ+61pwzn
 /LbXZZMdvSdnLKtlt120Uz76qut7/oA25Q9LVqMXHfmWuVPZ0vBgrJKkdEK/mf8HSOqE31fBx
 L/U+RGakcuPREMsUeqxZpHGEUbaA5InQlTGglZ06BFB1nUQxtdb7drVq48LSi7HMV57Gc9Szd
 CxjcyS1QxUJO+le8HNF2fYZkA14=
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 5/19/23 17:42, Alan Stern wrote:
> On Fri, May 19, 2023 at 12:38:15PM +0200, Helge Deller wrote:
>> Patch looks good and survived the test.
>>
>> Will you send a proper patch to the fbdev mailing list, so that I can
>> include it?
>
> Will do.

Great! Thanks!

> While you're working on this driver,

I'm not working on that driver. Just looked into it because of this
sysbot issue. I even don't have that hardware to test.

> here's a suggestion for another
> improvement you can make.  The temporary buffer allocations and calls to
> usb_control_msg() in dlfb_get_edid() and dlfb_select_std_channel() can
> be replaced with calls to usb_control_msg_recv() and
> usb_control_msg_send() respectively.

Ok, I'll look into it.

Helge
