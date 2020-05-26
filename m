Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5011D7447
	for <lists+linux-fbdev@lfdr.de>; Mon, 18 May 2020 11:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgERJoB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-fbdev@lfdr.de>); Mon, 18 May 2020 05:44:01 -0400
Received: from mga09.intel.com ([134.134.136.24]:16978 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgERJoA (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 18 May 2020 05:44:00 -0400
IronPort-SDR: 4Y2AVHaVQ68UL8phwnBtawBrXSp7fb+23mL+lgEQQzHkAogfIPlNs8V8w5m7n+J6WG3gyxRkr5
 Uz71VH8vr+vA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 02:44:00 -0700
IronPort-SDR: JGQXyuqQSYOzGoSi2bxPGdffy9Vk0iUNuzrWoQkUfLF+hM1sHQLYDDj0Q3UT0HYGpAkCr9PW5Z
 046UKEbMbUeg==
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; 
   d="scan'208";a="439152208"
Received: from ahermans-mobl.ger.corp.intel.com (HELO localhost) ([10.252.41.209])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 02:43:56 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     "Mun\, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
        "daniel\@ffwll.ch" <daniel@ffwll.ch>
Cc:     "ville.syrjala\@linux.intel.com" <ville.syrjala@linux.intel.com>,
        "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "laurent.pinchart\@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "daniel.vetter\@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "linux-fbdev\@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v12 00/14] In order to readout DP SDPs, refactors the handling of DP SDPs
In-Reply-To: <e2cf963c6db302d94195f4af643d8fbad3ece5dc.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com> <87eerm4vd0.fsf@intel.com> <20200515130612.GI6112@intel.com> <87zha92vf5.fsf@intel.com> <20200515141426.GI206103@phenom.ffwll.local> <e2cf963c6db302d94195f4af643d8fbad3ece5dc.camel@intel.com>
Date:   Mon, 18 May 2020 12:43:52 +0300
Message-ID: <87r1vh37dz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 15 May 2020, "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com> wrote:
> Hi Ville,
> Thank you for notifying me that. I definitely missed the crash.
> Sorry for that.
> Danial and Jani, I' under debugging the crash case.
> If you are availabe please do not merge current version.

It has been merged, and that's the oops is the main reason it got
noticed.

If you can produce a fairly quick fix, great, but otherwise we'll need
to revert enough commits to make this work again.

BR,
Jani.




>
> Br,
>
> G.G.
>
>> 
> On Fri, 2020-05-15 at 16:14 +0200, Daniel Vetter wrote:
>> On Fri, May 15, 2020 at 04:13:18PM +0300, Jani Nikula wrote:
>> > On Fri, 15 May 2020, Ville Syrjälä <ville.syrjala@linux.intel.com>
>> > wrote:
>> > > On Thu, May 14, 2020 at 02:19:23PM +0300, Jani Nikula wrote:
>> > > > On Thu, 14 May 2020, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com
>> > > > > wrote:
>> > > > > In order to readout DP SDPs (Secondary Data Packet: DP HDR
>> > > > > Metadata
>> > > > > Infoframe SDP, DP VSC SDP), it refactors handling DP SDPs
>> > > > > codes.
>> > > > > It adds new compute routines for DP HDR Metadata Infoframe
>> > > > > SDP
>> > > > > and DP VSC SDP. 
>> > > > > And new writing routines of DP SDPs (Secondary Data Packet)
>> > > > > that uses
>> > > > > computed configs.
>> > > > > New reading routines of DP SDPs are added for readout.
>> > > > > It adds a logging function for DP VSC SDP.
>> > > > > When receiving video it is very useful to be able to log DP
>> > > > > VSC SDP.
>> > > > > This greatly simplifies debugging.
>> > > > > In order to use a common VSC SDP Colorimetry calculating code
>> > > > > on PSR,
>> > > > > it uses a new psr vsc sdp compute routine.
>> > > > 
>> > > > Pushed the series to drm-intel-next-queued with Daniel's irc
>> > > > ack for
>> > > > merging the two non-i915 patches that route too.
>> > > 
>> > > fi-hsw-4770 now oopses at boot:
>> > 
>> > /o\
>> > 
>> > What did I miss? What part about the CI report did I overlook?
>> 
>> Participating hosts (48 -> 45)
>> ------------------------------
>> 
>>   Additional (1): fi-kbl-7560u 
>>   Missing    (4): fi-byt-clapper fi-byt-squawks fi-bsw-cyan fi-hsw-
>> 4200u
>> 
>> 
>> You kill machines at boot, CI won't tell you.
>> 
>> This is (or at least was) because the network is shitty enough that
>> we
>> have more spurious failures because the ethernet went into the ether
>> than
>> because of people having killed the machine with their patches for
>> real.
>> Also it's hard to grab logs if the thing doesn't work at all, so cant
>> give
>> you any more data than the above.
>> 
>> Yes this sucks :-/
>> 
>> Cheers, Daniel
>> 
>> > BR,
>> > Jani.
>> > 
>> > 
>> > > <1>[    3.736903] BUG: kernel NULL pointer dereference, address:
>> > > 0000000000000000
>> > > <1>[    3.736916] #PF: supervisor read access in kernel mode
>> > > <1>[    3.736916] #PF: error_code(0x0000) - not-present page
>> > > <6>[    3.736917] PGD 0 P4D 0 
>> > > <4>[    3.736919] Oops: 0000 [#1] PREEMPT SMP PTI
>> > > <4>[    3.736921] CPU: 0 PID: 363 Comm: systemd-udevd Not tainted
>> > > 5.7.0-rc5-CI-CI_DRM_8485+ #1
>> > > <4>[    3.736922] Hardware name: LENOVO 10AGS00601/SHARKBAY, BIOS
>> > > FBKT34AUS 04/24/2013
>> > > <4>[    3.736986] RIP: 0010:intel_psr_enabled+0x8/0x70 [i915]
>> > > <4>[    3.736988] Code: 18 48 c7 c6 40 09 79 a0 e8 e3 e2 04 e1 0f
>> > > b6 44 24 03 e9 f4 fd ff ff 90 66 2e 0f 1f 84 00 00 00 00 00 41 54
>> > > 55 53 48 83 ec 08 <48> 8b 9f d8 fe ff ff f6 83 5e 0d 00 00 20 74
>> > > 09 80 bb 6c b6 00 00
>> > > <4>[    3.737036] RSP: 0018:ffffc9000047f8a0 EFLAGS: 00010286
>> > > <4>[    3.737042] RAX: 0000000000000002 RBX: ffff8883ffd04000
>> > > RCX: 0000000000000001
>> > > <4>[    3.737048] RDX: 0000000000000007 RSI: ffff8883ffd04000
>> > > RDI: 0000000000000128
>> > > <4>[    3.737055] RBP: ffff888406afe200 R08: 000000000000000f
>> > > R09: 0000000000000001
>> > > <4>[    3.737061] R10: 0000000000000000 R11: 0000000000000000
>> > > R12: 0000000000000000
>> > > <4>[    3.737068] R13: ffff8883f75d0000 R14: ffff888406afe200
>> > > R15: ffff8883f75d0870
>> > > <4>[    3.737075] FS:  00007f71618f9680(0000)
>> > > GS:ffff88840ec00000(0000) knlGS:0000000000000000
>> > > <4>[    3.737082] CS:  0010 DS: 0000 ES: 0000 CR0:
>> > > 0000000080050033
>> > > <4>[    3.737088] CR2: 0000000000000000 CR3: 0000000402510002
>> > > CR4: 00000000001606f0
>> > > <4>[    3.737094] DR0: 0000000000000000 DR1: 0000000000000000
>> > > DR2: 0000000000000000
>> > > <4>[    3.737101] DR3: 0000000000000000 DR6: 00000000fffe0ff0
>> > > DR7: 0000000000000400
>> > > <4>[    3.737107] Call Trace:
>> > > <4>[    3.737175]  intel_read_dp_sdp+0x1a4/0x380 [i915]
>> > > <4>[    3.737246]  hsw_crt_get_config+0x12/0x40 [i915]
>> > > <4>[    3.737317]  intel_modeset_setup_hw_state+0x3b3/0x16a0
>> > > [i915]
>> > > ...
>> > 
>> > -- 
>> > Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
