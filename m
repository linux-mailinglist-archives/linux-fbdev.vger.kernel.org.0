Return-Path: <linux-fbdev+bounces-7387-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGfhBA0DFmrNgwcAu9opvQ
	(envelope-from <linux-fbdev+bounces-7387-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 May 2026 22:31:09 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A25DC51E
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 May 2026 22:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 096D6300D976
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 May 2026 20:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB0A277C81;
	Tue, 26 May 2026 20:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="qe+D0Fim"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D882264D6;
	Tue, 26 May 2026 20:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779827465; cv=none; b=cd3IouMHjBiUtOQ72T8F030DedOAkcr48kGSP7DILUZCAZ8WxOkhxtUec/N5CXfKCs9VgNvC2gn5oR6L2u3PuLDWu3M98N1vqMJ0GtP5txNE7IdIp5rFZl1pRa4EvpeasOUVdKmCI2qjUmCqbazOgRsCmufpj+SCR1GQksEy94A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779827465; c=relaxed/simple;
	bh=qcQtkeH6/tM2xUlisial8/6XUL4ycOWoDtS8uvilLw4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Qm83lVZCFfzTqQH7CXCiZjKVvWsXeizeRKID+pV2yykBS9zIgIdXbyLYrVsxGMWTzzurryT/LOBniGUb2hUm0qPCa8cIt5LARVJ7bv04Its/8NJ+x1h0gJ24fTgBHKlOOjk98L+O0UpSsUP2juqIqMT7xT9QZrUrOuV/9sK7EfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=qe+D0Fim; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews04-sea.riseup.net (fews04-sea-pn.riseup.net [10.0.1.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4gQ4C52NCfz9sJ2;
	Tue, 26 May 2026 20:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1779827457; bh=G7iBtbjg2uatkVEsxmQ8Z2QnSNE8lWO8CArC3nodSJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qe+D0Fiml+6dnobQa6Ek/gjFZESZSbJX51HpHWtPCDll8wF937+tTL1b2uxkhp/xJ
	 iB0QoCh9bSKRMSCrakZTRSDDleO1UWOkFqfptQoGB0BasYHOkBMepKJPEW+AUTLWnd
	 O3u5qVW8J+koPP7KdddMSM1CIWoKE8PGGwdQxzBg=
X-Riseup-User-ID: CE33B557F9E4490FC29B27A0FB3BBC0C95897F3EFFB9FE11010CA93D7C5C4802
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews04-sea.riseup.net (Postfix) with ESMTPSA id 4gQ4C450Lmz5w1G;
	Tue, 26 May 2026 20:30:56 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 26 May 2026 20:30:56 +0000
From: eamanu@riseup.net
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: sm750fb: fix CamelCase variables name in
 sm750
In-Reply-To: <2026052623-cause-region-02e3@gregkh>
References: <20260526131631.1237672-1-eamanu@riseup.net>
 <2026052623-cause-region-02e3@gregkh>
Message-ID: <b69100263ea16141b31a7dc240ccdc91@riseup.net>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[riseup.net,none];
	R_DKIM_ALLOW(-0.20)[riseup.net:s=squak];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev,intel.com];
	FROM_NEQ_ENVFROM(0.00)[eamanu@riseup.net,linux-fbdev@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[riseup.net:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7387-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C45A25DC51E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

thanks for your reply

On 2026-05-26 13:20, Greg KH wrote:
> On Tue, May 26, 2026 at 10:16:31AM -0300, Emmanuel Arias wrote:
>> Replace CamelCase variable name with snake_case:
>> - pvReg -> pv_reg
> 
> Why are you keeping the "pv_"?  What does that mean?

Sorry, I'm trying to start contributing in the kernel. I run

  scripts/checkpatch.pl --file drivers/staging/sm750fb/*.c 

And the output was:

drivers/staging/sm750fb/sm750.c
-------------------------------
WARNING: static const char * array should probably be static const char
* const
#36: FILE: drivers/staging/sm750fb/sm750.c:36:
+static const char *g_fbmode[] = {NULL, NULL};

CHECK: Avoid CamelCase: <pvReg>
#758: FILE: drivers/staging/sm750fb/sm750.c:758:
+       crtc->cursor.mmio = sm750_dev->pvReg +

CHECK: Avoid CamelCase: <setAllEngOff>
#863: FILE: drivers/staging/sm750fb/sm750.c:863:
+       sm750_dev->init_parm.setAllEngOff = 0;

total: 0 errors, 1 warnings, 2 checks, 1171 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or
--fix-inplace.

So I tried to change pvReg for pv_reg and the same for setAllEngOff.

> 
>> - setAllEngOff -> set_all_eng_off
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> The test robot told you to make this change?

As I understand the test robot failed because:


   drivers/staging/sm750fb/sm750_hw.c: In function 'hw_sm750_map':
>> drivers/staging/sm750fb/sm750_hw.c:43:13: error: 'struct sm750_dev' has no member named 'pvReg'; did you mean 'pv_reg'?
     sm750_dev->pvReg =
                ^~~~~
                pv_reg

> 
>> Closes: https://lore.kernel.org/oe-kbuild-all/202605171049.KbaBnrJV-lkp@intel.com/
>> Signed-off-by: Emmanuel Arias <eamanu@riseup.net>
>> ---
>>  drivers/staging/sm750fb/sm750.c    |  6 +++---
>>  drivers/staging/sm750fb/sm750.h    |  4 ++--
>>  drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
>>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> What changed from v1?

So, in this v2 I added sm750_hw.c.

Please let me know if I misunderstood the workflow

> 
> thanks,
> 
> greg k-h

Cheers,
Emmanuel

