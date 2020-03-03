Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47BA2177975
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Mar 2020 15:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbgCCOqy (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Mar 2020 09:46:54 -0500
Received: from mga06.intel.com ([134.134.136.31]:28088 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726766AbgCCOqx (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 3 Mar 2020 09:46:53 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 06:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="233636484"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga008.jf.intel.com with SMTP; 03 Mar 2020 06:46:49 -0800
Received: by stinkbox (sSMTP sendmail emulation); Tue, 03 Mar 2020 16:46:49 +0200
Date:   Tue, 3 Mar 2020 16:46:49 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Cc:     b.zolnierkie@samsung.com, wangkefeng.wang@huawei.com,
        sergey.senozhatsky@gmail.com, pmladek@suse.com, akpm@osdl.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] vgacon: Fix a UAF in vgacon_invert_region
Message-ID: <20200303144649.GT13686@intel.com>
References: <20200303032036.40560-1-zhangxiaoxu5@huawei.com>
 <20200303135940.GS13686@intel.com>
 <67073029-8477-5f5a-ed2a-bb5ad4896878@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67073029-8477-5f5a-ed2a-bb5ad4896878@huawei.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Mar 03, 2020 at 10:30:14PM +0800, zhangxiaoxu (A) wrote:
> 
> 
> 在 2020/3/3 21:59, Ville Syrjälä 写道:
> > That doesn't match how vc_screenbuf_size is computed elsewhere. Also
> > a lot of places seem to assume that the screenbuf can be larger than
> > vga_vram_size (eg. all the memcpy()s pick the smaller size of the
> > two).
> Yes, in the vga source code, we also pick the smaller size of two. But
> in other place, eg: vc_do_resize, copy the old_origin to new_origin, we
> not do that. It also make bad access happen. it maybe CVE-2020-8647.
> 
> I think we should just assume the width/height maybe larger than the
> default, not the screenbuf larger than vga_vram_size.
> 
> If not, any useful of the larger screenbuf?

Maybe used for scrolling?

> 
> > 
> > And you're changing the behaviour of the code when
> > 'width % 2 && user' is true

-- 
Ville Syrjälä
Intel
