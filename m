Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FD21D78E9
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 May 2020 14:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgERMr2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 18 May 2020 08:47:28 -0400
Received: from kernel.crashing.org ([76.164.61.194]:35458 "EHLO
        kernel.crashing.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgERMr2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 18 May 2020 08:47:28 -0400
Received: from localhost (gate.crashing.org [63.228.1.57])
        (authenticated bits=0)
        by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 04ICktr9019310
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 18 May 2020 07:46:58 -0500
Message-ID: <9ea9bd468fbce85b666991cde4196b88c7929e1d.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Emil Velikov <emil.l.velikov@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        Antonino Daplas <adaplas@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev <linux-fbdev@vger.kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date:   Mon, 18 May 2020 22:46:54 +1000
In-Reply-To: <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
         <20200517220524.4036334-2-emil.l.velikov@gmail.com>
         <87d071aedu.fsf@mpe.ellerman.id.au>
         <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 2020-05-18 at 12:19 +0100, Emil Velikov wrote:
> 
>  - attempted out-of-bound attempts to read the vbios

So on these things, the actual ROM doesn't contain what you want, but
the device-tree has a property "NVDA,BMP" that contains some kind of
mini-BIOS (around 2.4KB) which should contain the necessary tables the
driver is looking for.

I think nouveau has code to find these in nvkm/subdev/bios/shadowof.c,
so at least that should have been working, but maybe some
debugging/instrumentation would be useful there.

> Genuine concern or noise? Likely using the bios from open firmware,
> check any of the other options - see NvBios in [1]
>  - cannot figure out the timer input frequency
> No idea
>  - the TV1 EDID is empty
> Is there an actual TV connected to the device, check with another cable

Probaby not.

> Regardless of the patches, reporting [2] the above would be a nice move.
> 
> Thanks
> Emil
> [1] https://nouveau.freedesktop.org/wiki/KernelModuleParameters/
> [2] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues

