Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9661778EA
	for <lists+linux-fbdev@lfdr.de>; Tue,  3 Mar 2020 15:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgCCOan (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Mar 2020 09:30:43 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:54988 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727199AbgCCOan (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 3 Mar 2020 09:30:43 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 44C59CB55BA70598217E;
        Tue,  3 Mar 2020 22:30:24 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.145) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Mar 2020
 22:30:14 +0800
Subject: Re: [PATCH] vgacon: Fix a UAF in vgacon_invert_region
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC:     <b.zolnierkie@samsung.com>, <wangkefeng.wang@huawei.com>,
        <sergey.senozhatsky@gmail.com>, <pmladek@suse.com>,
        <akpm@osdl.org>, <linux-fbdev@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>
References: <20200303032036.40560-1-zhangxiaoxu5@huawei.com>
 <20200303135940.GS13686@intel.com>
From:   "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Message-ID: <67073029-8477-5f5a-ed2a-bb5ad4896878@huawei.com>
Date:   Tue, 3 Mar 2020 22:30:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200303135940.GS13686@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.220.145]
X-CFilter-Loop: Reflected
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



在 2020/3/3 21:59, Ville Syrjälä 写道:
> That doesn't match how vc_screenbuf_size is computed elsewhere. Also
> a lot of places seem to assume that the screenbuf can be larger than
> vga_vram_size (eg. all the memcpy()s pick the smaller size of the
> two).
Yes, in the vga source code, we also pick the smaller size of two. But
in other place, eg: vc_do_resize, copy the old_origin to new_origin, we
not do that. It also make bad access happen. it maybe CVE-2020-8647.

I think we should just assume the width/height maybe larger than the
default, not the screenbuf larger than vga_vram_size.

If not, any useful of the larger screenbuf?

> 
> And you're changing the behaviour of the code when
> 'width % 2 && user' is true

