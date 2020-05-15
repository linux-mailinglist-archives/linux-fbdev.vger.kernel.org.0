Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECFA1D5024
	for <lists+linux-fbdev@lfdr.de>; Fri, 15 May 2020 16:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgEOOOb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 15 May 2020 10:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726016AbgEOOOb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 15 May 2020 10:14:31 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B37C061A0C
        for <linux-fbdev@vger.kernel.org>; Fri, 15 May 2020 07:14:30 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e16so3730288wra.7
        for <linux-fbdev@vger.kernel.org>; Fri, 15 May 2020 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=75mytnsZSW494ezzILP9HOEPjF4cYjBQvV72zHXjVsk=;
        b=jIhdtQ/wrRK/lvciskioZccjkpI8vyqTPNOit2Gg21ag2loY+O+TNFVHPXd3tmj4ST
         R0PcCu0ihnJuHE2HhFNC8D+MSHOzs1IgQyPF7tvgsPx95DlT/xTVPo3dDAx8APQU8sym
         0zShFPno9J6SNWtN3Hp6gaQbelareIxoDlNVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=75mytnsZSW494ezzILP9HOEPjF4cYjBQvV72zHXjVsk=;
        b=DkRrZRaOBVgESbLt7wxdr1/aJ6TYQixeJMbksGK9jU+GHDSmAeJLiRQ/fWeVyr+KOR
         HYqbLzSHLkPlx/u5EsKhQGyVx6Yq7Ns22hUcn4eZFFxeA329WPOraJF+R9euYzrphCRr
         mzUPBPVwMshk1dP8Xj/Zb06wGXdzyfAvOwC9TEIRPvtp1JDSfKdDVwsXvhTOMInwj2j3
         svzBgstov47dnm9qABhp3VrtCvrwwjb7M9Jf5IHfOMTNA9HOVVmabNlx2OF9Q+8Hph2w
         invK/j+MFnpT6ZHA33RKZycY48NE6Ok4zcr9SJFrmQPa9e7KG6d1JG+TTybfLndXO3tX
         kugA==
X-Gm-Message-State: AOAM532PzNLQlS28Hk5TT7MC/BjmRJWl0WmNZg3SkTvbxzgyGowD8ZSD
        GhNGtAVjoq+cUrLP5P/qLGp0OAt8ZTA=
X-Google-Smtp-Source: ABdhPJx9P2iM/DwMwqAedF1D9rW6k90+F9vmbtNvRw8SIicpdiNm4dezPuj1b9Y1Ph9c4sLB/2tGDQ==
X-Received: by 2002:a5d:6b83:: with SMTP id n3mr4822679wrx.213.1589552069335;
        Fri, 15 May 2020 07:14:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e7sm4136911wrp.0.2020.05.15.07.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:14:28 -0700 (PDT)
Date:   Fri, 15 May 2020 16:14:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        daniel.vetter@ffwll.ch
Subject: Re: [PATCH v12 00/14] In order to readout DP SDPs, refactors the
 handling of DP SDPs
Message-ID: <20200515141426.GI206103@phenom.ffwll.local>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
 <87eerm4vd0.fsf@intel.com>
 <20200515130612.GI6112@intel.com>
 <87zha92vf5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zha92vf5.fsf@intel.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, May 15, 2020 at 04:13:18PM +0300, Jani Nikula wrote:
> On Fri, 15 May 2020, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Thu, May 14, 2020 at 02:19:23PM +0300, Jani Nikula wrote:
> >> On Thu, 14 May 2020, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> >> > In order to readout DP SDPs (Secondary Data Packet: DP HDR Metadata
> >> > Infoframe SDP, DP VSC SDP), it refactors handling DP SDPs codes.
> >> > It adds new compute routines for DP HDR Metadata Infoframe SDP
> >> > and DP VSC SDP. 
> >> > And new writing routines of DP SDPs (Secondary Data Packet) that uses
> >> > computed configs.
> >> > New reading routines of DP SDPs are added for readout.
> >> > It adds a logging function for DP VSC SDP.
> >> > When receiving video it is very useful to be able to log DP VSC SDP.
> >> > This greatly simplifies debugging.
> >> > In order to use a common VSC SDP Colorimetry calculating code on PSR,
> >> > it uses a new psr vsc sdp compute routine.
> >> 
> >> Pushed the series to drm-intel-next-queued with Daniel's irc ack for
> >> merging the two non-i915 patches that route too.
> >
> > fi-hsw-4770 now oopses at boot:
> 
> /o\
> 
> What did I miss? What part about the CI report did I overlook?

Participating hosts (48 -> 45)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (4): fi-byt-clapper fi-byt-squawks fi-bsw-cyan fi-hsw-4200u


You kill machines at boot, CI won't tell you.

This is (or at least was) because the network is shitty enough that we
have more spurious failures because the ethernet went into the ether than
because of people having killed the machine with their patches for real.
Also it's hard to grab logs if the thing doesn't work at all, so cant give
you any more data than the above.

Yes this sucks :-/

Cheers, Daniel

> 
> BR,
> Jani.
> 
> 
> >
> > <1>[    3.736903] BUG: kernel NULL pointer dereference, address: 0000000000000000
> > <1>[    3.736916] #PF: supervisor read access in kernel mode
> > <1>[    3.736916] #PF: error_code(0x0000) - not-present page
> > <6>[    3.736917] PGD 0 P4D 0 
> > <4>[    3.736919] Oops: 0000 [#1] PREEMPT SMP PTI
> > <4>[    3.736921] CPU: 0 PID: 363 Comm: systemd-udevd Not tainted 5.7.0-rc5-CI-CI_DRM_8485+ #1
> > <4>[    3.736922] Hardware name: LENOVO 10AGS00601/SHARKBAY, BIOS FBKT34AUS 04/24/2013
> > <4>[    3.736986] RIP: 0010:intel_psr_enabled+0x8/0x70 [i915]
> > <4>[    3.736988] Code: 18 48 c7 c6 40 09 79 a0 e8 e3 e2 04 e1 0f b6 44 24 03 e9 f4 fd ff ff 90 66 2e 0f 1f 84 00 00 00 00 00 41 54 55 53 48 83 ec 08 <48> 8b 9f d8 fe ff ff f6 83 5e 0d 00 00 20 74 09 80 bb 6c b6 00 00
> > <4>[    3.737036] RSP: 0018:ffffc9000047f8a0 EFLAGS: 00010286
> > <4>[    3.737042] RAX: 0000000000000002 RBX: ffff8883ffd04000 RCX: 0000000000000001
> > <4>[    3.737048] RDX: 0000000000000007 RSI: ffff8883ffd04000 RDI: 0000000000000128
> > <4>[    3.737055] RBP: ffff888406afe200 R08: 000000000000000f R09: 0000000000000001
> > <4>[    3.737061] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> > <4>[    3.737068] R13: ffff8883f75d0000 R14: ffff888406afe200 R15: ffff8883f75d0870
> > <4>[    3.737075] FS:  00007f71618f9680(0000) GS:ffff88840ec00000(0000) knlGS:0000000000000000
> > <4>[    3.737082] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > <4>[    3.737088] CR2: 0000000000000000 CR3: 0000000402510002 CR4: 00000000001606f0
> > <4>[    3.737094] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > <4>[    3.737101] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > <4>[    3.737107] Call Trace:
> > <4>[    3.737175]  intel_read_dp_sdp+0x1a4/0x380 [i915]
> > <4>[    3.737246]  hsw_crt_get_config+0x12/0x40 [i915]
> > <4>[    3.737317]  intel_modeset_setup_hw_state+0x3b3/0x16a0 [i915]
> > ...
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
