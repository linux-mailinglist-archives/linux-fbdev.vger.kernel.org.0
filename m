Return-Path: <linux-fbdev+bounces-7996-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y9CUC7w2V2rKHQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7996-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Jul 2026 09:29:00 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB3075B6C5
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Jul 2026 09:28:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RfqnnlAL;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7996-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7996-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B59A300951C
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Jul 2026 07:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2669C3C1F2B;
	Wed, 15 Jul 2026 07:28:57 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894DB3C343E
	for <linux-fbdev@vger.kernel.org>; Wed, 15 Jul 2026 07:28:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100534; cv=none; b=HZtrjNxLCvz9MqAJbhXQiH/bB0R4ekkeKvMAb74zyOsVr+t5g+UwR/7ZI9eppOVOZx4uhVW5VXjFVnfDisAs8hb+4KYx7+m390q981eFMHF9WH/nyePJj60rskU3Xtes0fxfljdkNPPPFDwN1G0QNp1CRY6ciHweislr88HLiGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100534; c=relaxed/simple;
	bh=kyLCZZV9kbfs2YsCqC/zFnPHyjufd3uJsLGVylKb0mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opCliC+OenSiynmExpRl0zkhe2GmS3Qi6PcRX542KUEaI5iuGNoLkx8qGnYN2qXAOqJbN3eCOZZ1OlZyjI3pdNyAKajnEorIN0j/LjV4+3KuBxIjSOGjgU85s+WRd9EJOF3kxv+2We54fBTJsCCaFLffUzQRzf3QNlPH6t6AM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfqnnlAL; arc=none smtp.client-ip=209.85.161.45
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6a3d9aded38so200507eaf.1
        for <linux-fbdev@vger.kernel.org>; Wed, 15 Jul 2026 00:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784100527; x=1784705327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UxQ0BxbdBsXkQRkJTN/tYd3cFPb7z2YjlCsAC7VkUCY=;
        b=RfqnnlALI/z9GiNooOhqDwqyoMUKcbUBag3Xu+nwbDbYggTYg7kukHDPvyDM3NWofi
         6Ny5AY51is/RVcCw6KkRFolWkQ3Ip1PVdnrpuBxw+ds7+ohq2J6st+YNQ6mOMyD6xoS5
         aqKQwNo3yiea/T7yxCKXvGJE4iHcj6fqOww63URwQmS9XjNRPF5wzChgpPvcdNqYjHMb
         NEgFWvN+ri8sgALOQRx+wzTodkiG1y9vE5q6FrzUVG9mZevbNU8F6msBS/p/RVp1YkJr
         K2OMpR7nvGH3vYmd6BDsUmIpOjLFb+tobSpAKv4GaQ4yDBxlvJmuly//SLwwC1NzB+PX
         +8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784100527; x=1784705327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxQ0BxbdBsXkQRkJTN/tYd3cFPb7z2YjlCsAC7VkUCY=;
        b=OppgBTeYoun8tUZ/WZQCCdkLBwtQsS9a9YpKo04n497z8ebZc11sEnFbBMNRhmDFpO
         DaPNMaPRGbYdUIITMCNEXqn3HksBVuvgqtILrkD/n3QGooaC+zdpuif3WiaowkcS8M1k
         +ZHZmp3VqbQJbpwyP4LvUPdSB27cWOnxVvs4GQH2GjAM015XOXlPBgX2sTQiaOExUDBK
         sUy1cx254LKdUVj+pdMStv0UGXCRUDElrz2mFkwOZqTQadxVgzevu67o7ZI0l5DFpC6A
         3lY2vmsrMq55E8wZx4ASfifcScHinNONyOWoRdMJCdWFbLJ+51lql7eqCHjsE26KIntS
         Xj1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqkaqxCEHH2ZOrpG8DJ64pV9xRnMBoJKpiCr8Ayo3WYnz9YizDpkNhRzBijqeIxUF+jBxotcfpXWgKOHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxErEwbHOeS4eHh32hKiKvnSRm/3RLed8dpJ033RRLRMHKdZMLV
	81j581KXgahUjWMBH35ssxpLG2q4mj9ALhsz8P++LJ2WArE9g++V4T8G
X-Gm-Gg: AfdE7cntSVy+lDuvrVJf4G/lnicV8t0PrZyuj9K9OLuUq7SP5jx8GbNAw1OtxRphsE6
	Y6TPldT7PMO6LUrQuhgSqC1H+yIKlK062qX2cpxdogsEntizbwbDGJl5G3/jmU19xhQJ6CihIKz
	YnTV/Kumwl5KZH8cjeaMGzPgWjwab32s4QAV/HKTsq7WddKxdRd5D/fXawQU8TH6Rze7VMJHV1b
	UoXqtKPtZkYjDfEj/ElAW4CxLDJpYUdkJJdF8HEuZb+cTfzAt2/Ru3HqVbQRMG2Yxms4ljUBqMV
	eBtUCIddWRloJ/LTacx6gyaGtJWrsJJwUrA2Zi05c4R6HPqebGH4jc4liRRn2ZXJnV1wnuX7SYX
	VegZk1QxJWNghtN3yLHOwk7EhApmcTPjXfhru0Vn4Scu38jekVj6+m0xf5g05ij/7P55fzrVpl0
	9bpZD8
X-Received: by 2002:a05:6820:f021:b0:6a3:1b9a:48e8 with SMTP id 006d021491bc7-6a39bee8e8bmr7442734eaf.33.1784100527217;
        Wed, 15 Jul 2026 00:28:47 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a3b0d60sm15711707eaf.0.2026.07.15.00.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:28:45 -0700 (PDT)
Date: Wed, 15 Jul 2026 10:28:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Panagiotis Gravias <graviaspanagiotis1@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, namcao@linutronix.de,
	tomasz.unger@yahoo.pl, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging/fbtft: Minor cleanups.
Message-ID: <alc2pxlSIEv5FMWa@stanley.mountain>
References: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7996-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:graviaspanagiotis1@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:namcao@linutronix.de,m:tomasz.unger@yahoo.pl,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linutronix.de,yahoo.pl,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-fbdev@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CB3075B6C5

On Tue, Jul 14, 2026 at 10:09:38PM +0300, Panagiotis Gravias wrote:
> Solved some style errors,
> parenthesis spacing, aligning arguments, replacing udelay() with
> usleep_range().
> 
> I hope this makes future checks with the style script cleaner and more
> helpfull.
> 

With old code you should search lore for why it still exists.

regards,
dan carpenter


