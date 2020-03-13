Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 843EB184899
	for <lists+linux-fbdev@lfdr.de>; Fri, 13 Mar 2020 14:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgCMN5G (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 13 Mar 2020 09:57:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46848 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgCMN5G (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 13 Mar 2020 09:57:06 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DDuwcv024360;
        Fri, 13 Mar 2020 08:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584107818;
        bh=GBfQ2U4h7W+sFa+Ijpcch+QhRJihZSmOMPAE+Mj+Lc4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TDGAQFqNcveuTsu0zVPs5lYvxxaAWVmpqLa70V08DqlBodB80YcFvkMfFnlIDqc9l
         s2gf4D2Y96D4ZK9ERg2m+XF6LKGnKPR92smmj95R5dBaG3HTjfzl9XIzhcw8J1zPxl
         J39qxWca8hCJar8tC7BlPuCFv+wqd39dL8+lwEK4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DDuwjO090419
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 08:56:58 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 08:56:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 08:56:58 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DDuuvc007020;
        Fri, 13 Mar 2020 08:56:57 -0500
Subject: Re: [PATCH] omapfb: Remove unused writeback code
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20200313122410.7528-1-tomi.valkeinen@ti.com>
 <20200313132244.GB4751@pendragon.ideasonboard.com>
 <249364fc-bc83-6fe6-d3bf-f709505c299e@ti.com>
 <20200313133803.GA9070@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <64b002c9-15df-2662-b969-e9696821b07a@ti.com>
Date:   Fri, 13 Mar 2020 15:56:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313133803.GA9070@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 13/03/2020 15:38, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Fri, Mar 13, 2020 at 03:30:15PM +0200, Tomi Valkeinen wrote:
>> On 13/03/2020 15:22, Laurent Pinchart wrote:
>>> On Fri, Mar 13, 2020 at 02:24:10PM +0200, Tomi Valkeinen wrote:
>>>> Remove unused writeback code. This code will never be used, as omapfb is
>>>> being deprecated.
>>>
>>> I'm fine with that, but out of curiosity, is there any particular reason
>>> to remove that code now instead of letting omapfb bitrot slowly ?
>>
>> It conflicts with tidss's writeback code in TI kernel, when compiling tidss and omapfb into the
>> kernel. I thought this is the easiest way to resolve that, as all the removed code is dead code,
>> instead of trying to invent new names in tidss for a lot of functions.
>>
>> Probably the functions in tidss still could use some renaming in the future, but I didn't want to be
>> forced to do that because of omapfb's dead code...
> 
> Could you do both ? :-) It's not good using too generic names in tidss.
> You can just prefix the functions with tidss_. There's a risk of
> conflict with omapdrm too if the names are too generic.

I will, but I didn't want to start doing that right now. tidss has just been merged to mainline, and 
tidss is still under active development, so doing such a change is an invitation to conflicts. I'd 
like things to settle down a bit first.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
