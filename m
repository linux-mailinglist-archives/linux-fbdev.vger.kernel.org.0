Return-Path: <linux-fbdev+bounces-5996-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFfaBDiGe2lOFQIAu9opvQ
	(envelope-from <linux-fbdev+bounces-5996-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 17:09:28 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67589B1DA2
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 17:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0860306FFC8
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 16:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F7A337BBD;
	Thu, 29 Jan 2026 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2Wf2Hxo"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DF133554F;
	Thu, 29 Jan 2026 16:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702659; cv=none; b=iBLo5YdRTwmGWxQwEl8pYVIxunaACaJy0MMmjiNyeaPnOVwqlJc6iRPLEXdBIpgun1kG7vGAk/PcAZTiHtZxNkEMUmysSSuZt84hfVkCs2xOoaYWBvlvQoGsMpnFphxtGM9hWbNn71olZtQvabXWoQlJN5cfuUtNOm+N+7+c9ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702659; c=relaxed/simple;
	bh=Hsz8qVupp8+NBvqtE7ko8C6bGpcKwwmmGaTx6H1EiqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V71V+EuK34ywenuEmdLWUAo5oUfgZC+JbJBhJ+DGq+/r6z4M++FkqYySaTFSqSghGfFol+mZuMLwa4dfUwSWBc6buat9j2YV+kB0JsBm4ZDA2IorKXEL3ptYpdMcBl5GT3tDga1kxevdDzDl0hkhSoSGdFHZtFDtTv3GCUi/UrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2Wf2Hxo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26058C4CEF7;
	Thu, 29 Jan 2026 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769702659;
	bh=Hsz8qVupp8+NBvqtE7ko8C6bGpcKwwmmGaTx6H1EiqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2Wf2Hxot7/wQdQ5EAONpILruPThqD+wOYp/fN1PpHt88KkuuorOZTojO7L5poDY8
	 METdail+riAgkkvuD0gAroqSaI8QQNjwz/qSOMvTVpNJokFQdPP7pnqkTHf5IvgeLO
	 UVvc+Q9ZrQ+GffeGowBZR5rL9JDiY8vHUXITndav8S+n6yoL0HqkaNmYyh/vz0TgGS
	 XSK5SLepAeymWT9vncwNV1IItUnWKrnyjv1a59Ccjy49lM9Mynt1g+H7SqRUoaHjDx
	 mObKP5HvV9nUMNzIF7NtYee/UVLTQGDBXucglYobu4YCggqM5edPDiq7F1cWJIbS/L
	 gxxnHFQm88yGg==
Date: Thu, 29 Jan 2026 10:04:18 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/4] dt-bindings: backlight: Add max25014 support
Message-ID: <20260129160418.GA1100798-robh@kernel.org>
References: <20260123-max25014-v7-0-15e504b9acc7@gocontroll.com>
 <20260123-max25014-v7-1-15e504b9acc7@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-max25014-v7-1-15e504b9acc7@gocontroll.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,pengutronix.de,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-5996-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 67589B1DA2
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:31:30PM +0100, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> 
> ---
> 
> In the current implementation the control registers for channel 1,
> control all channels. So only one led subnode with led-sources is
> supported right now. If at some point the driver functionality is
> expanded the bindings can be easily extended with it.
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 91 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 000000000000..c499e6224a8f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

No child nodes (with addresses), so these should be dropped. And in the 
example.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

