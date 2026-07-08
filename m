Return-Path: <linux-fbdev+bounces-7898-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id psCNHZd3TmpkNQIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7898-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 08 Jul 2026 18:15:19 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7CD7288C5
	for <lists+linux-fbdev@lfdr.de>; Wed, 08 Jul 2026 18:15:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="F/xDcraq";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7898-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7898-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A18EE32473C1
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Jul 2026 15:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73220374186;
	Wed,  8 Jul 2026 15:46:13 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B4A3FD129
	for <linux-fbdev@vger.kernel.org>; Wed,  8 Jul 2026 15:46:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525573; cv=none; b=uZcuEO+zKGcigre0gItdq50Pw4zMwHtzAZ+iu7eGKGEWsOkV0b6B9Krbcej4ocKvvgROn9F7L56WEMEEiW5TkD2t2yVGYSzhzZCVp314EnAhphsdCPfsFrXccLeaM7wCVtOAeUPNDsQkUR2Y++ZEVY76oidwd9LZE1yI2CpmeXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525573; c=relaxed/simple;
	bh=6o/Os/YHoHLpbGBJ/Oz87lOS4kylKBP062qGBWElKsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDuBpsqFwGllXoEyjb0OboKEuA6WfoREX6Fk0K4Q4eARul3XoNDm8CGMgJhC0eL3bHcgKWOXId+JcOz1qjnXZP3N7Eg7ORBlNo0FhMBJnHRAD+aP0yI5DAeaUlYiZ6zW5ym/OLqO36Lm9JlkxqMJdjACzJSDnbWWBSMx+builJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F/xDcraq; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47de0093c42so881832f8f.3
        for <linux-fbdev@vger.kernel.org>; Wed, 08 Jul 2026 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783525566; x=1784130366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFzX8ayLrWD5LLPflyw5iQn6+h660qomUnmCAVS4si0=;
        b=F/xDcraqE7zjRny9dGpElvcrYP+TvLHulDUmHNdZhg0hx4k/ecCY84wCOji4oou5cz
         VXJpUOkuokde7MMu0flycEjUugRu4z0NFWPcqjYItrQ3J4nRTl3+vzC1w1b3HnpGNxdf
         H64963aqUef7jrOhAPDPzwH79R8InoYlihBzie9t14dqKK4Fl1xxfHrt+T3uIIp5iYi4
         gfE2K5QZBbk3aiPJN4k0Xu9STGQab/mn2KuaphtmU3Nl1u9Dmd/gQc4sqc0+srk3Dgcr
         JHFdBIBj+w+scyPJLw/BVf9V6UaVNl407BpnFBOfTrzUF22wnSL5rqwEUY1MvfPw1fLm
         ueMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525566; x=1784130366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFzX8ayLrWD5LLPflyw5iQn6+h660qomUnmCAVS4si0=;
        b=Z5nQx3kGthW5ZNvFROzKwNw7fkFyct9GnCdg1O5EaFplAZITmerp2BaA8GlBqwqxUl
         Ypmd9tPAymaUBfGxSmma6KQUlLweWwjzQHdTE8nTcyRWewPv9sYKRaOXe2m0qvbnFOT7
         xjVENopYmsM8ZekE6iTTTTHYu/nCJpCJf0JBnnA5NP4YGHJyqYbnOB6cja4pW8ztxTuO
         HTKUYP3LReu72ifFG1aeL7cP/q5D99HN7OP8bWvE1SD7WL0FG+vjdETpL3y+GcZrYd/U
         Y+JYtFuxt+vQciV3d40FPbQrTgxrBRywCf2SD5J66T9cRzCPR9csJNYSSea8XgOCjJ/o
         p93A==
X-Forwarded-Encrypted: i=1; AHgh+RqChp0CJbVevlxxmQ5hOn5xEuPDuFXI8EezCCTBIcPgo2rn2ANpzUZ/QDHolBfunZBbrIe1HYfmvF8Ahw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhwJeOf3FA/fm9JI9PnHEUCo/EuPC/jGWkgGoeccOrziC2INRS
	YhsmJMFZsTWCXMOFVRGB7O91F2D1BK5ejTBhIstfHbt6FxqijLasLHazeQmaC3Lknco=
X-Gm-Gg: AfdE7ckRdYCuYz7Pwj1TiAutJBmc3SP/Xo1dyFNJLNlf00Ic2rSpQ/vo7DWcL58mrYz
	hGmw8rId43AEbjciY3ldGh2sof6Dpcd0meUdTGHFgvrpquDDRLnCPzgjlIQ9u17zhCQ8bm9rcyQ
	rT1H+7wOqXsI8SVj7Ogkx8yNdkTaNEU9V+cIHqjd6vD0GQFazdWeOzs0NtEZ/UqGLVc463NiHOC
	fp8b5+BuHvpeiORG+lc8qcJwuXvSf0nu2udKxFzaUdDtzbrHR0nMxz3uzYFVx9BYya5lGEccrQH
	6taUGOGR0mxoosOZZp61UBX0HFnxx+VR8QWWAlHD70WM3z2R/XHv5l0kmfiX7bLbliXBDnOB/ZI
	Ev2FL4UcerGkfjOj1syjdtN5YVV602XvKmQAoayhrO3+d1Spzdi5xXNAnfKv0pKGen4Lhu5F+bH
	C8PkMJcu4f6TBW7EYkt3BCEv1h1l3XVA==
X-Received: by 2002:a05:6000:26d0:b0:473:673e:3836 with SMTP id ffacd0b85a97d-47df078bb73mr3861713f8f.28.1783525565920;
        Wed, 08 Jul 2026 08:46:05 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm44806847f8f.11.2026.07.08.08.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:46:05 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Michal Januszewski <spock@gentoo.org>,
	Helge Deller <deller@gmx.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-acpi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,
	cgroups@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH 2/2] module: Bring includes in linux/kmod.h up to date
Date: Wed,  8 Jul 2026 17:44:30 +0200
Message-ID: <20260708154510.6794-3-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708154510.6794-1-petr.pavlu@suse.com>
References: <20260708154510.6794-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tony.luck@intel.com,m:bp@alien8.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:spock@gentoo.org,m:deller@gmx.de,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:trondmy@kernel.org,m:anna@kernel.org,m:cel@kernel.org,m:jlayton@kernel.org,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,m:tom@talpey.com,m:mark@fasheh.com,m:jlbec@evilplan.org,m:joseph.qi@linux.alibaba.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:pavel@kernel.org,m:lenb@kernel.org,m:akpm@linux-foundation.org,m:dakr@kernel.org,m:razor@blackwall.org,m:idosch@nvidia.com,m:davem@davemloft.net,m:e
 dumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:dhowells@redhat.com,m:jarkko@kernel.org,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:takedakn@nttdata.co.jp,m:penguin-kernel@I-love.SAKURA.ne.jp,m:linux-edac@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:drbd-dev@lists.linux.dev,m:linux-block@vger.kernel.org,m:greybus-dev@lists.linaro.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-acpi@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fsdevel@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:cgroups@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:bridge@lists.linux.dev,m:netdev@vger.kernel.org,m:keyrings@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7898-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,alien8.de,kernel.org,redhat.com,linux.intel.com,zytor.com,linbit.com,kernel.dk,linuxfoundation.org,gentoo.org,gmx.de,zeniv.linux.org.uk,suse.cz,brown.name,oracle.com,talpey.com,fasheh.com,evilplan.org,linux.alibaba.com,cmpxchg.org,suse.com,google.com,atomlin.com,linux-foundation.org,blackwall.org,nvidia.com,davemloft.net,paul-moore.com,namei.org,hallyn.com,nttdata.co.jp,I-love.SAKURA.ne.jp];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[77];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA7CD7288C5

Including linux/kmod.h alone results in 1.5 MB of preprocessed output, even
though it provides only a few functions and macros.

The header currently depends on:

* __printf() -> linux/compiler_attributes.h,
* ENOSYS -> linux/errno.h,
* bool -> linux/types.h.

Include only these files, reducing the preprocessed output to 10 kB.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/kmod.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/linux/kmod.h b/include/linux/kmod.h
index 9a07c3215389..b9474a62a568 100644
--- a/include/linux/kmod.h
+++ b/include/linux/kmod.h
@@ -2,17 +2,9 @@
 #ifndef __LINUX_KMOD_H__
 #define __LINUX_KMOD_H__
 
-/*
- *	include/linux/kmod.h
- */
-
-#include <linux/umh.h>
-#include <linux/gfp.h>
-#include <linux/stddef.h>
+#include <linux/compiler_attributes.h>
 #include <linux/errno.h>
-#include <linux/compiler.h>
-#include <linux/workqueue.h>
-#include <linux/sysctl.h>
+#include <linux/types.h>
 
 #ifdef CONFIG_MODULES
 /* modprobe exit status on success, -ve on error.  Return value
-- 
2.54.0


