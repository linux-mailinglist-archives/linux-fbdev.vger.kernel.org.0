Return-Path: <linux-fbdev+bounces-6673-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP4oGZ+uu2k8mgIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6673-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Mar 2026 09:06:55 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E6D2C7A5D
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Mar 2026 09:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64DBA3011154
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Mar 2026 08:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BCF3A6EFE;
	Thu, 19 Mar 2026 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xyrtlGI8"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5B03A6B8D
	for <linux-fbdev@vger.kernel.org>; Thu, 19 Mar 2026 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907611; cv=none; b=XrOU67guSL5qwx/pXPquvsXD5BUYW8bGn3Y/UVUpJ713ZGotul+X8fvXesZhAE1iwXyG+AYLEHsZP+6k6VgZ8z7ju7IZxtW9Ay+RSWpW0Gqqc28fzyRjlScY6SaA/dMjfIhBfKD5AJmgjIk7/PKTEAcQRfgAlftGP5Z8lLvLi5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907611; c=relaxed/simple;
	bh=aeM4Jx+xJMgx4dbVDSvRpVc/hXULtx2vu/MM9QkUv7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SjCmk5Vn7Nrb7R1BLMjBEbZk8U+GLrjwAH9J38T78edXTgeIZGxVPU/04hU4Wy7k4xyN9Ed62+KpTUFMd2z0UnVpK31Nn83R0ZNPygmtIpsvTlGttVqCXJ8A+YRnMKOXE2Tm+ESfF/xJ7YbzxahleoDRJS8r4KS8V60V5kbT9Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xyrtlGI8; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=de6sE0gCPgrQLlge7GJt5+7mdZ20YrkwDcyPCmIYdVQ=;
	b=xyrtlGI8N5W0OqJoOiz2rntCCfiKwiaRAAAYOwqZqmdMSWeqYtOGYjRGWBFtTlnmPT/yfzWzj
	PCSewm+U1YSDipSNpqz0Exgws1TKde7eJCIP/kN6hTFJzv9ByelYVstgwAZ0+vnU9U9eADfEeIW
	68G2YJDSMMmpQWqfErpiWEE=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fbynR0xD8z12LD3;
	Thu, 19 Mar 2026 16:01:15 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 0107540538;
	Thu, 19 Mar 2026 16:06:46 +0800 (CST)
Received: from [10.174.179.11] (10.174.179.11) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Mar 2026 16:06:45 +0800
Message-ID: <e5f7611f-f087-4835-99e3-4fddc927aab8@huawei.com>
Date: Thu, 19 Mar 2026 16:06:44 +0800
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: matroxfb: remove dead code and set but not
 used variable
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>,
	<linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<b.zolnierkie@samsung.com>
References: <20200403021609.20968-1-yanaijie@huawei.com>
 <20200408101852.GC20795@ravnborg.org> <abpX_2PUWie03GdG@black.igk.intel.com>
 <17605e19-065c-4b71-abb2-a9c9a7b9ddc6@huawei.com>
 <abun9dwCYAWd1nIB@ashevche-desk.local>
From: Jason Yan <yanaijie@huawei.com>
In-Reply-To: <abun9dwCYAWd1nIB@ashevche-desk.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ravnborg.org,gmx.de,vger.kernel.org,lists.freedesktop.org,samsung.com];
	TAGGED_FROM(0.00)[bounces-6673-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yanaijie@huawei.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 34E6D2C7A5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

在 2026/3/19 15:38, Andy Shevchenko 写道:
> On Thu, Mar 19, 2026 at 10:22:08AM +0800, Jason Yan wrote:
>> 在 2026/3/18 15:45, Andy Shevchenko 写道:
>>> On Wed, Apr 08, 2020 at 10:18:52AM +0000, Sam Ravnborg wrote:
>>>> On Fri, Apr 03, 2020 at 10:16:09AM +0800, Jason Yan wrote:
>>>>> Fix the following gcc warning:
>>>>>
>>>>> drivers/video/fbdev/matrox/g450_pll.c:336:15: warning: variable
>>>>> ‘pixel_vco’ set but not used [-Wunused-but-set-variable]
>>>>>     unsigned int pixel_vco;
>>>>>                  ^~~~~~~~~
>>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>>>>
>>>> Thanks, committed and pushed to drm-misc-next.
>>>> The fix will show up in upstream kernel at the next
>>>> merge window.
>>>
>>> The most of the patches from so called Hulk Robot appeared to be controversial.
>>>
>>> First of all, even so called "dead code" may have side effects on the registers
>>> in HW which may lead to other issues. Second, the mentioned dead code elimination
>>> patch doesn't improve anything as now the dead code is 'mnp' variable (that's how
>>> I got into that, I still have a build error).
>>
>> Sorry, I do not understand what side effects this may cause. Would you
>> please explain it in detail?
> 
> Any IO (and specifically on PCI bus) may have side effects. If the removed code
> did some HW accesses (especially reads), it affects the state of HW. You can
> read more about PCI bus and what read from it does.

No, the removed code did not do any IO and will not affect the state of HW.

> 
> Helge, can we revert this change and start over, please? (I can also send
> revert if you think it's a better way)

I don't think we need to revert this patch. Please provide proof that 
this modification will lead to real issues.

Thanks,
Jason

> 
> I do not believe this change was ever tested on real HW, and I see an evidence
> that this most likely was blindly made as it led to the similar issue after
> the change.
> 
>>> That said, for the starter I suggest to revert this change. After one need go
>>> carefully through code to understand if it's exactly the case and what to do with
>>> 'mnp' which involves some IO.
>>>
>>> +Cc: current fbdev maintainers
> 

