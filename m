Return-Path: <linux-fbdev+bounces-6705-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHgyBi2rwWmUUQQAu9opvQ
	(envelope-from <linux-fbdev+bounces-6705-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Mar 2026 22:05:49 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B082FD90B
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Mar 2026 22:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B281230439DB
	for <lists+linux-fbdev@lfdr.de>; Mon, 23 Mar 2026 21:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6A4373BE4;
	Mon, 23 Mar 2026 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLR/rmA/"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388F9372ECA;
	Mon, 23 Mar 2026 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774299752; cv=none; b=fL2YfCplCpaK8Byb4V9Tk6wlY7xPi6s9DJHigi86nrAUz6sesVjMMLblFuTMIg+6y/FjBcnlUpduLyTiZyG03aUqTg06pj0erdW10lAi8jM9MdNHmUgVICpbthpu/vj7Ae7ZHK8INeBYx1aYDwzKs5PsbIzlOXutTcdpkG8XP7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774299752; c=relaxed/simple;
	bh=zDuT7d/olP2YmOM9X6hWOR4dtrKPBLYPfN26Inboa/A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=cQ4dcY6fzZ+G7HxF5jVB0PD1e7gNSYYPoh++pjVSq3BCYvFNYe53FELo8td4QKLObZp1VcGVzTpz2C21U0Kc+pTW1MZPVARUmofsEdlvRwSwWdB0tULDsmhGwpATn5ZOe0TxLqsd1Vyhl1FYTtPyWLvW6zPOjiIRZj7czQTBkd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLR/rmA/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2147C4CEF7;
	Mon, 23 Mar 2026 21:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774299751;
	bh=zDuT7d/olP2YmOM9X6hWOR4dtrKPBLYPfN26Inboa/A=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=GLR/rmA/8rg4R6Xc5Mjb3Tznf0PtDUBvTLDg/mlrZT8nn72k+YiazJ/wvC8ua8KAa
	 SMQzKo0lMbRXnQkL4m0ona/AxPa+hrqvWQNRPIIY2TQytJuzDDuDvFDSfrcXxrxOft
	 gWiCSxK/i7HiYSU0EMxA9ME6M8xPK/DaWX/Qf2itQTbC9HebMl8Pabr898zTEmRs1+
	 N4Yrsm4d2x/jPQiPiwpto8eE5BYP5mX6ZR+KJ8MzhfOXqD/dTNMGVMmc+NVEdfiCWi
	 XwZasPpm0q95PBRMf0CtHjDXJ5j5L/gTrLc+0x9kb0XbY7+PLhRNqTvnb3/ckx3kQt
	 i8c2rTFliRc3A==
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 22:02:20 +0100
Message-Id: <DHAGRK6EYUH8.3K8PRCLYA2UBA@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Dave
 Airlie" <airlied@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nikola Djukic" <ndjukic@nvidia.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Andrea Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp
 Stanner" <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 <alexeyi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <joel@joelfernandes.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v14 0/2] Rust GPU buddy allocator bindings
References: <20260320045711.43494-1-joelagnelf@nvidia.com>
In-Reply-To: <20260320045711.43494-1-joelagnelf@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	TAGGED_FROM(0.00)[bounces-6705-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86B082FD90B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Mar 20, 2026 at 5:57 AM CET, Joel Fernandes wrote:

Applied to drm-rust-next, thanks!

> Joel Fernandes (2):
>   rust: gpu: Add GPU buddy allocator bindings

    [ * Use doc-comments for GpuBuddyAllocMode methods and GpuBuddyGuard,
      * Fix comma splice in GpuBuddyParams::chunk_size doc-comment,
      * Remove redundant summary in GpuBuddy::new doc-comment,
      * Drop Rust helper for gpu_buddy_block_size().

        - Danilo ]

>   MAINTAINERS: gpu: buddy: Update reviewer

