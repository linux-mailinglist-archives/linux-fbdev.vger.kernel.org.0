Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0006C17879A
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Mar 2020 02:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgCDBbe (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 3 Mar 2020 20:31:34 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11138 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727865AbgCDBbe (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 3 Mar 2020 20:31:34 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 0AAACC87A8B01059C2C9;
        Wed,  4 Mar 2020 09:31:31 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.145) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Mar 2020
 09:31:21 +0800
Subject: Re: [PATCH] vgacon: Fix a UAF in vgacon_invert_region
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC:     <b.zolnierkie@samsung.com>, <wangkefeng.wang@huawei.com>,
        <sergey.senozhatsky@gmail.com>, <pmladek@suse.com>,
        <akpm@osdl.org>, <linux-fbdev@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>
References: <20200303032036.40560-1-zhangxiaoxu5@huawei.com>
 <20200303135940.GS13686@intel.com>
 <67073029-8477-5f5a-ed2a-bb5ad4896878@huawei.com>
 <20200303144649.GT13686@intel.com>
From:   "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Message-ID: <5c63d51f-b396-f2a7-a7c2-3b8af0bb54b0@huawei.com>
Date:   Wed, 4 Mar 2020 09:31:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200303144649.GT13686@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.220.145]
X-CFilter-Loop: Reflected
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



在 2020/3/3 22:46, Ville Syrjälä 写道:
> On Tue, Mar 03, 2020 at 10:30:14PM +0800, zhangxiaoxu (A) wrote:
>>
>>
>> 在 2020/3/3 21:59, Ville Syrjälä 写道:
>>> That doesn't match how vc_screenbuf_size is computed elsewhere. Also
>>> a lot of places seem to assume that the screenbuf can be larger than
>>> vga_vram_size (eg. all the memcpy()s pick the smaller size of the
>>> two).
>> Yes, in the vga source code, we also pick the smaller size of two. But
>> in other place, eg: vc_do_resize, copy the old_origin to new_origin, we
>> not do that. It also make bad access happen. it maybe CVE-2020-8647.
>>
>> I think we should just assume the width/height maybe larger than the
>> default, not the screenbuf larger than vga_vram_size.
>>
>> If not, any useful of the larger screenbuf?
> 
> Maybe used for scrolling?
The screenbuf just allocated with cols and rows, it can be save just one
screen?
vc_do_resize is the largest size which one screen can be shown?

If so, we can't set the screen to the resolution which more than it's
capability?
> 
>>
>>>
>>> And you're changing the behaviour of the code when
>>> 'width % 2 && user' is true
> 

