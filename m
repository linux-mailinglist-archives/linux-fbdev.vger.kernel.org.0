Return-Path: <linux-fbdev+bounces-7914-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8NoiFb5vT2q7ggIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7914-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 09 Jul 2026 11:54:06 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3CA72F292
	for <lists+linux-fbdev@lfdr.de>; Thu, 09 Jul 2026 11:54:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=PovcRIVX;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7914-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7914-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47A6730238E1
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Jul 2026 09:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7939402B96;
	Thu,  9 Jul 2026 09:50:00 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98683F4DEE
	for <linux-fbdev@vger.kernel.org>; Thu,  9 Jul 2026 09:49:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590600; cv=none; b=NNJ6nvvrlxZ/U23yKppUpXhhWODqXbZmAdfuI9P/XbD9VRnABYhNsJQlfPBU2Y6gltUySTMqG9/nYXgiBozoMBVk9PIoQNVlzRy3NTQa6hGgi5XQQNpOWIryr0Y99k4KwZWGsbNKaH/S+9dfb5o4pi1auXG7yXtB4WvnZT/ZMZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590600; c=relaxed/simple;
	bh=jTFvyUggpn9b7ir5dJXF/0vV6aESSqllkJsE1EJX8x0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4+8lashjB4rZkNocv115YAiHlgBvHEVrMohMRXGt6fLV1VctgDUK+h7PYi3Hgt4kGdBiv41QMXsBmgIV2o4hg2OPF9sdipbgYbMWNj2ybPnYRJ6alm0PXOO2nSDxG9ZwZuXXmwxkvOB0YsSP/vWvNHtSOTxtHw4O4E9oy0OBJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PovcRIVX; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so15647425e9.1
        for <linux-fbdev@vger.kernel.org>; Thu, 09 Jul 2026 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783590589; x=1784195389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXemn+RWgfgniHXL+Z+iccp115cwF5wMpUS4nNjdkFs=;
        b=PovcRIVXEPSF/FJeQlxhlzoXjqZOrbs3CiE5bUYuum/kokSouOcrfuWzkJz+QZ+EEU
         bXZutBCPHghMPuDpORpgqEkhwf9ItYai/C2Wls7hXpV8JBACI0ISAzSZohMkmVLXApNn
         fZlxwp5LQbRlt1W9WkBqq04596J259cyQGkTEsx5D5ai1Vpe/8NCZrLqgzS5soekf8Zd
         N1CUWCeoaHYptaJl5ecJ1ZzDp9e7jZkz7Z27dZDIG4LQ8N1cI1J5HRitdDR0mFAuAiJK
         tCK2hnhPLuoPo29pU3Y3TxhIiW33KldSOjrnaQ78LbO8JgLXI4Yv8EB+9OvmBldN7dCE
         StRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590589; x=1784195389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXemn+RWgfgniHXL+Z+iccp115cwF5wMpUS4nNjdkFs=;
        b=T52BbW96l04jfcLRHjW4HS0gDooY04a2YxBDLuMB6eUfz/iExXj9fycfrqMxKO0/7C
         NG4xX4eB8mUwPpuSc83BUHpTH/f+XEJXO2h1IlpKnwAL81vkbn/YzMuS9Wo3RnQ5vaGL
         EGjggRuXQhpkI01exXLPjXtfcU2W/Q2Jwwq7WwuA4PaCdeYLtpbobX5DAuh8PfJtw2js
         uGF0OqCxH6LfFrq6APEsZWIhZHn1oJV6LpoDpD5/bUVyJ1t2ilV6H7S5+8EN/xIn9VT0
         IuWirqFcdQ/oZIZZyYl03LzF7QDxrTkmNVW5NqTx376gODwFst+/GOkNa/tU2k//v/Fk
         1Vmw==
X-Forwarded-Encrypted: i=1; AHgh+Rph0mivf65zrgS5JN0i3j/2mWZpTOEYoWBuf+M4dgARQV4Ud5a3kBG9ZAlv3+Di4/AwTuxppghh5KroqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx223x0N6tvQD0773pOa9Xg8qpf4aIYm6QhbbOwa9gx18cdu8oJ
	hixTV4mTV56T7BjBws4Bmua+s12fZdThyUhzzwSjQLahHQ/YJS2CMSqN05B2KzlR/TI=
X-Gm-Gg: AfdE7cmGkZNG0cox3VwRXfaTJYW7mHqKA2nfsXtXpAxaRm4GQGjcbpN4/p8FYxEc+g0
	UWs+5gm1FBsnhQWwtUEDHzHmj1br0jRfWz+aDgez7j1RKJOzA2JGtuBewtVu1RAxiQyjzJ3nmPG
	I+e5LEk0Mk7nP3FV1wGb9SixpVTwvK7XrVKMA4VJp3fqkX5kHy/X9dqQI9cndFv06MqgiqHOz8U
	GYtjnnz6fWeQKN98vKslBZplei8NyCnFd5UNRHP2Q416CsF0k3/tKnip7+cMvqEOw3UucJNk/in
	EXCaXzYO835AVJ21eSC8hfeePJ0p0GjAMrIeKWErrMpErEIA9CyGZBd2lUzllgs4biMz570+CNN
	+W044XWnMb+1FTUYXbteNBqZqz86AzSxubZ8GuDv78UwVTxUwiA/wBdScqtifsJMGcQHGrTJ8ax
	/JvxK+/YYUt6H1OOrRPAi1+z9IzyhRTZHkSQ==
X-Received: by 2002:a05:600c:c1d7:20b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-493e68c3535mr47652155e9.25.1783590588957;
        Thu, 09 Jul 2026 02:49:48 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d53absm47837275e9.6.2026.07.09.02.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 02:49:48 -0700 (PDT)
Message-ID: <3e2ae6e8-41ad-45f0-a885-131a5711c276@suse.com>
Date: Thu, 9 Jul 2026 11:49:45 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] umh, treewide: Explicitly include linux/umh.h where
 needed
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Michal Januszewski <spock@gentoo.org>, Helge Deller <deller@gmx.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Pavel Machek <pavel@kernel.org>,
 Len Brown <lenb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Nikolay Aleksandrov
 <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 drbd-dev@lists.linux.dev, linux-block@vger.kernel.org,
 greybus-dev@lists.linaro.org, linuxppc-dev@lists.ozlabs.org,
 linux-acpi@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 cgroups@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
 bridge@lists.linux.dev, netdev@vger.kernel.org, keyrings@vger.kernel.org,
 linux-security-module@vger.kernel.org
References: <20260708154510.6794-1-petr.pavlu@suse.com>
 <20260708154510.6794-2-petr.pavlu@suse.com>
 <ak6STbqZd-Q-c56v@localhost.localdomain>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <ak6STbqZd-Q-c56v@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,linux-fbdev@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,alien8.de,kernel.org,redhat.com,linux.intel.com,zytor.com,linbit.com,kernel.dk,linuxfoundation.org,gentoo.org,gmx.de,zeniv.linux.org.uk,suse.cz,brown.name,oracle.com,talpey.com,fasheh.com,evilplan.org,linux.alibaba.com,cmpxchg.org,google.com,atomlin.com,linux-foundation.org,blackwall.org,nvidia.com,davemloft.net,paul-moore.com,namei.org,hallyn.com,nttdata.co.jp,i-love.sakura.ne.jp,vger.kernel.org,lists.linux.dev,lists.linaro.org,lists.ozlabs.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-7914-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mkoutny@suse.com,m:tony.luck@intel.com,m:bp@alien8.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:spock@gentoo.org,m:deller@gmx.de,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:trondmy@kernel.org,m:anna@kernel.org,m:cel@kernel.org,m:jlayton@kernel.org,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,m:tom@talpey.com,m:mark@fasheh.com,m:jlbec@evilplan.org,m:joseph.qi@linux.alibaba.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mcgrof@kernel.org,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:pavel@kernel.org,m:lenb@kernel.org,m:akpm@linux-foundation.org,m:dakr@kernel.org,m:razor@blackwall.org,m:idosch@nvidia.com,m:davem@davemloft.net,m:edumazet@google.com,m:k
 uba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:dhowells@redhat.com,m:jarkko@kernel.org,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:takedakn@nttdata.co.jp,m:penguin-kernel@i-love.sakura.ne.jp,m:linux-edac@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:drbd-dev@lists.linux.dev,m:linux-block@vger.kernel.org,m:greybus-dev@lists.linaro.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-acpi@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fsdevel@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:cgroups@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:bridge@lists.linux.dev,m:netdev@vger.kernel.org,m:keyrings@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[76];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC3CA72F292

On 7/8/26 8:13 PM, Michal Koutný wrote:
> Hi Petr.
> 
> On Wed, Jul 08, 2026 at 05:44:29PM +0200, Petr Pavlu <petr.pavlu@suse.com> wrote:
>> diff --git a/kernel/cgroup/cgroup-v1.c b/kernel/cgroup/cgroup-v1.c
>> index a4337c9b5287..60eb994c32ae 100644
>> --- a/kernel/cgroup/cgroup-v1.c
>> +++ b/kernel/cgroup/cgroup-v1.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/pid_namespace.h>
>>  #include <linux/cgroupstats.h>
>>  #include <linux/fs_parser.h>
>> +#include <linux/umh.h>
>>  
>>  #include <trace/events/cgroup.h>
> 
> There is kmod.h in here too but it's unnecessary, no module lazy loading
> in this code.

You're right. I'll remove the kmod.h include from
kernel/cgroup/cgroup-v1.c. I went through all the files again and it
seems this was the only place I missed.

-- 
Thanks,
Petr

