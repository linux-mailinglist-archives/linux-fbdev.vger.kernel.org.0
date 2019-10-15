Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6A59D769E
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2019 14:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfJOMdl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 15 Oct 2019 08:33:41 -0400
Received: from welho-filter4.welho.com ([83.102.41.26]:49206 "EHLO
        welho-filter4.welho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfJOMdk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 15 Oct 2019 08:33:40 -0400
X-Greylist: delayed 555 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Oct 2019 08:33:40 EDT
Received: from localhost (localhost [127.0.0.1])
        by welho-filter4.welho.com (Postfix) with ESMTP id 7C5874FB75;
        Tue, 15 Oct 2019 15:24:23 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp1.welho.com ([IPv6:::ffff:83.102.41.84])
        by localhost (welho-filter4.welho.com [::ffff:83.102.41.26]) (amavisd-new, port 10024)
        with ESMTP id DJdlGMKQ4NVu; Tue, 15 Oct 2019 15:24:22 +0300 (EEST)
Received: from mail.korsu.shacknet.nu (89-27-55-156.bb.dnainternet.fi [89.27.55.156])
        by welho-smtp1.welho.com (Postfix) with ESMTP id 9E6FE2A0;
        Tue, 15 Oct 2019 15:24:03 +0300 (EEST)
Received: from galatea (galatea.korsu.shacknet.nu [192.168.2.117])
        by mail.korsu.shacknet.nu (Postfix) with SMTP id AB7CD868;
        Tue, 15 Oct 2019 14:48:43 +0300 (EEST)
Received: by galatea (sSMTP sendmail emulation); Tue, 15 Oct 2019 14:48:43 +0300
Date:   Tue, 15 Oct 2019 14:48:43 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <syrjala@sci.fi>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, b.zolnierkie@samsung.com, ajax@redhat.com,
        ville.syrjala@linux.intel.com, malat@debian.org,
        michel@daenzer.net, corbet@lwn.net, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 14/15] staging/mgakms: Import matroxfb driver source
 code
Message-ID: <20191015114843.GB4104@sci.fi>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, sean@poorly.run, b.zolnierkie@samsung.com,
        ajax@redhat.com, ville.syrjala@linux.intel.com, malat@debian.org,
        michel@daenzer.net, corbet@lwn.net, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-15-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191014140416.28517-15-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Oct 14, 2019 at 04:04:15PM +0200, Thomas Zimmermann wrote:
> Only code is being copied, no functional changes are made.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/staging/mgakms/g450_pll.c         |  539 +++++a

...

Personally I would start from scratch. In fact some years (*cough*
decade) ago I did just that and started writing a new driver for
matrox stuff. Unfortunately I ran out of steam after figuring out
most of the interesting hardware quirks and whatnot, so I never
finished it. The end result is that it still runs in userspace
but kinda looks like a kernel driver if you squint a bit.

Anyways, I just slapped a MIT license on it  dumped the whole
thing here:
https://gitlab.com/syrjala/mga
The development history was, shall we say, not really useful
so I just squashed it.

You, or someone else, might find it interesting. I think in
terms of hardware support it's a superset of any other driver,
apart from the blob.

-- 
Ville Syrjälä
syrjala@sci.fi
http://www.sci.fi/~syrjala/
