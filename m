Return-Path: <linux-fbdev+bounces-6636-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM6rOqa3uWnJMQIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6636-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 17 Mar 2026 21:20:54 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5FA2B22D7
	for <lists+linux-fbdev@lfdr.de>; Tue, 17 Mar 2026 21:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08980302DE7F
	for <lists+linux-fbdev@lfdr.de>; Tue, 17 Mar 2026 20:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855A6385512;
	Tue, 17 Mar 2026 20:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5jqVpcm"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6188135BDB2;
	Tue, 17 Mar 2026 20:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773778849; cv=none; b=SmkM3HMLAAdINY2LNoz7NEIIrih4FHcygJoqQC5SLthh7BIp/YRSlWfe8pHfmh/ETPWGSTXlW+RSR3DdpoXikOc+S9VQLnK/NGlFcW2xNMkZHOq3l/tys98pSkkz7BmlfdZqasL5RTtJ2qmnd2oyS416XNBqAgQHzjY8rRX9dDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773778849; c=relaxed/simple;
	bh=Qmle9txu0KZ/bF0+kcgC8Uln28DfPARF0J6ui6/x01Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=XUaJCIUKPIjKQLIdUGkqkzUt9oNwqug780ARaD/1rjNUd/+hWggFh3ZBkGO3bTI/MUmcil20aUmAEtW74bmZVoyOVv+v9mSgOc55+jzvfG50HJfDQIVYoR9a4uP+hIk/npcMFWEqDHDdjIPSLmY8I5IrEPo8lu8h99lBCfuBVew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5jqVpcm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09757C4CEF7;
	Tue, 17 Mar 2026 20:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773778848;
	bh=Qmle9txu0KZ/bF0+kcgC8Uln28DfPARF0J6ui6/x01Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=r5jqVpcmS+5zZBfGilDMs0BFWj7L8gwoVVURthNmeotNe7o0FpSLAzqALX/pqW02e
	 zm6Fx6y5YS2RcmczPhdxzW70/HcKt6CXR/RnXz+01g7GHPezNpZm/hkVBXx5DRRr83
	 T8F2On0S7JNiCJODM2K/5TsOOhPoXJxxj7H0qYv8P3eqGf3vqL+lpVFSt2l6MAHjea
	 2VqHFC+rzaXyceLXGBgG8n6zUCG244Zxyq4gc2/bRAtHxmUARPUDXnRVu2lBEdRa1P
	 LGQvIcb+DaWHOiOCwsm+BKVR4EqDm0YKWm5/4KDwRjXyGnQvfTb2Qcnf5eTZ11KIs9
	 Vnp6ay6q8KdSA==
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 21:20:37 +0100
Message-Id: <DH5C4CMXIPXU.3AM5V38WUQRWQ@kernel.org>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked
 list interface
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Dave Airlie" <airlied@redhat.com>, "David
 Airlie" <airlied@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Simona Vetter"
 <simona@ffwll.ch>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Koen
 Koning" <koen.koning@linux.intel.com>, "Nikola Djukic"
 <ndjukic@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Philipp
 Stanner" <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Jonathan Corbet" <corbet@lwn.net>, "Alex Deucher"
 <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang
 Rui" <ray.huang@amd.com>, "Matthew Auld" <matthew.auld@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, "Lucas De Marchi"
 <lucas.demarchi@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Helge Deller" <deller@gmx.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>,
 <alexeyi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com>
 <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
In-Reply-To: <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-6636-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE5FA2B22D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 17, 2026 at 9:18 PM CET, Joel Fernandes wrote:
> Sorry, I forgot to add an additional F: for the rust/kernel/interop.rs fi=
le.
> Danilo/Miguel, do you mind adding this when applying?

I can add it, all good.

