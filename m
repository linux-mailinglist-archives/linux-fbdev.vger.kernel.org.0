Return-Path: <linux-fbdev+bounces-6193-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DcVEDhKjGmukgAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6193-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Feb 2026 10:22:00 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE7C122AB9
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Feb 2026 10:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B85F330086ED
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Feb 2026 09:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A2D354AE0;
	Wed, 11 Feb 2026 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvQ3ewTX"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F72338581;
	Wed, 11 Feb 2026 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770801694; cv=none; b=FT/NYo3uc3WtQze4M0wVMU1pg+UyYzztjzFUbAkDct0gElHOnQVZUa0FbFbUADtW5xQj+vvjO2eOQmjS8FXlIYfuHsH3xNd3HK49YUafeQ1XgTMsFlht0h0bLu4aKB+u4Pg/YfFZF4whEDHmox2yJr7NJOv3e2vYjWlZcGag1+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770801694; c=relaxed/simple;
	bh=bbT8L9yuhCkcKZIt2AwaX5L7rkxzlrBrldrxjRCY6Qc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=i3ogM5Wpw53nP2KEg78SYBGKqL0tmlWzqqsWhJZJp1KX9lhA+QEdfxhC/cJb7OUQearI3uu4WxVHpUQHeH0H/ODfw59/6gxTs6uQYPBBc9w0B07GBloVMFhNq4ew9DzaafaNDIAmJcfyt2IF222pL6Alp5fuMwN6mn2YJa9OJ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvQ3ewTX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F38C4CEF7;
	Wed, 11 Feb 2026 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770801694;
	bh=bbT8L9yuhCkcKZIt2AwaX5L7rkxzlrBrldrxjRCY6Qc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=WvQ3ewTXZ2lQSqYQAAxvDxZIXx23sQMjCI9kZmySTxXf08I7vSWq2wMpO6JUEUGPl
	 84R832HYeYTEN0Sk2sDTMYgyZkGhgpKuuL7Gt2uee/ViV4W3er/rKoAd6jcx/tqQ19
	 OiCiuHd9MlBlEh9GPY3AlGmbqCZfyIWufwYIkkLGn7LojPEaoyHXlkqjdE3pLOOABq
	 cEOz7Oqh37c+3cpcftV6Nhv8NFmzgTs1tkvuXcpbqOFtPCbG7YslH9I9XRCg0Rs5Bs
	 AN7w3KKk1aPoNzeTaCrUukzHvsI39VzMEwYkAqejXLvG4xov+ipmcO0xKsgvmnwAFG
	 aTpMU/ppeRiXA==
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 10:21:23 +0100
Message-Id: <DGC0T35RJU05.2TLS17F5B30B3@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alice Ryhl" <aliceryhl@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Alistair Popple" <apopple@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Philipp Stanner"
 <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Edwin Peer" <epeer@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Balbir Singh"
 <balbirs@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH -next v9 3/3] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
 <20260210233204.790524-4-joelagnelf@nvidia.com>
In-Reply-To: <20260210233204.790524-4-joelagnelf@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6193-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9CE7C122AB9
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 12:32 AM CET, Joel Fernandes wrote:
> nova-core will use the GPU buddy allocator for physical VRAM management.
> Enable it in Kconfig.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> index 527920f9c4d3..6513007bf66f 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -3,8 +3,9 @@ config NOVA_CORE
>  	depends on 64BIT
>  	depends on PCI
>  	depends on RUST
> -	select RUST_FW_LOADER_ABSTRACTIONS

I think moving this should be a separate patch.

>  	select AUXILIARY_BUS
> +	select GPU_BUDDY
> +	select RUST_FW_LOADER_ABSTRACTIONS
>  	default n
>  	help
>  	  Choose this if you want to build the Nova Core driver for Nvidia
> --=20
> 2.34.1


