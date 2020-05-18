Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA51D1D78C7
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 May 2020 14:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgERMk2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 18 May 2020 08:40:28 -0400
Received: from kernel.crashing.org ([76.164.61.194]:35428 "EHLO
        kernel.crashing.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgERMk2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 18 May 2020 08:40:28 -0400
Received: from localhost (gate.crashing.org [63.228.1.57])
        (authenticated bits=0)
        by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 04ICdm4v019140
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 18 May 2020 07:39:52 -0500
Message-ID: <906228e89ae11cad241f78ac74142d030f3ab16e.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        Antonino Daplas <adaplas@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev <linux-fbdev@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date:   Mon, 18 May 2020 22:39:47 +1000
In-Reply-To: <CACvgo52Qws2VF0Bui-V3VdL5CFLsean9H=shLBi5H2S2fvjFSA@mail.gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
         <20200517220524.4036334-2-emil.l.velikov@gmail.com>
         <9b0db95949b973c682b449906573e7b28c6113ef.camel@kernel.crashing.org>
         <CACvgo52Qws2VF0Bui-V3VdL5CFLsean9H=shLBi5H2S2fvjFSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 2020-05-18 at 12:00 +0100, Emil Velikov wrote:
> I believe you reported issues due to different page size for the CPU/GPU.
> Have you tried nouveau recently, there has been a handful of patches
> on the topic since your report.
> 
> Alternatively, it would make sense you rebase, cleanup and merge your patch.

That was a problem for the G5s. There were other issues for more
ancient machines with older nVidia GPUs. Additionally a lot of those
Apple machines don't have a BIOS ROM to get the various tables from.

At this stage unfortunately I don't have access to most of that HW to
test with anymore. I do have one G5 I might be able to dig out of my
basement this week to try out.

In any case, digging out that patch should be useful as powerpc64 is
still 64k pages :)

Cheers,
Ben.

