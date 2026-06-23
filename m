Return-Path: <linux-fbdev+bounces-7685-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kenxI+hTOmrQ6AcAu9opvQ
	(envelope-from <linux-fbdev+bounces-7685-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jun 2026 11:37:44 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F246B5DB0
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jun 2026 11:37:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="fWbK/2Se";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7685-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7685-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E381B3026FF3
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jun 2026 09:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEC63B992C;
	Tue, 23 Jun 2026 09:37:39 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F081394792;
	Tue, 23 Jun 2026 09:37:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207459; cv=none; b=iU0Obesz3HibO7pVz3Yp3gWchbpsgcjOPykQJDBVhv4sYduJF5l2Djg5NrqI16OpxVtb5puk5WNczqd9+5vyfooQs2RRFoOT3hI7+XlUX+UE497qxX35M2RnyWBMHqXy6UcnuEOWecMkoe21GFu4gJZkwT49hO6gSnfdn0lNLb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207459; c=relaxed/simple;
	bh=JksADWb34Msa6pz390S5qh5F2TMVd8PTqSrktgyXJvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZA7ClkJGczfvQowG9ec0c+UoZ+Sv6uPouMj/Use0AjuVKyqdWXKDAWPwOm39oS5JKBRxXX5/ErcAxadRGmS0vCytLwHUpsJG7NeAnolBDKVj+JkErwSZZZRxqlIJBD8dJ3Uiq2UgIR/fcP/yQ/zEEsu9myoxZV+zY2Ne7nkc/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWbK/2Se; arc=none smtp.client-ip=192.198.163.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782207458; x=1813743458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JksADWb34Msa6pz390S5qh5F2TMVd8PTqSrktgyXJvQ=;
  b=fWbK/2SenuwJCpmAHaKcLOdObaZdQM47lDvELZEBvP2aIpD5lfklnOE9
   3J+d9FyKs+kEKeSKMKTTDL72s1iCjEqkWBUK/837xDBPruaFym97wzoBd
   NWn8Y/fyvU09WbxUdVhZnWWroQgMMLLp/8GOYDctqG8DZdU/RDOG+JLsa
   hHnBs3fFwBtU68N8XPjtc7vt9yVTcXWyeHboTm9cOJQ7jEP/VZ2QSql5x
   7bFY2FlkdA4NhLT1CFEO1R0THYhdSNsGCoD/uJAKaI3cpXnHwt5JhHszL
   qeog7LMjT6JVbr2VkDDyoBS9aSKhqGe04WLP1n6xLyEIO/PcIFhWuRa+5
   w==;
X-CSE-ConnectionGUID: M0LUMtoPRRSGb37B2LyH7Q==
X-CSE-MsgGUID: TEmZjMe5RGWX6XrOn7zzxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93601374"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="93601374"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:37:38 -0700
X-CSE-ConnectionGUID: NYS6AyGOQLat9wdWX+4nDg==
X-CSE-MsgGUID: 4Ud/jYYTQ4KM1DK9TFbu3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="251405333"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:37:33 -0700
Date: Tue, 23 Jun 2026 12:37:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andy@kernel.org, gregkh@linuxfoundation.org,
	deller@gmx.de, azuddinadam@gmail.com, chintanlike@gmail.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 3/4] drm/ssd130x: Add SSD135X_FAMILY and SSD1351
 support
Message-ID: <ajpT24VIdrZdEzel@ashevche-desk.local>
References: <20260622152506.78627-1-amit.barzilai22@gmail.com>
 <20260622152506.78627-4-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622152506.78627-4-amit.barzilai22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7685-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amit.barzilai22@gmail.com,m:javierm@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:azuddinadam@gmail.com,m:chintanlike@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:amitbarzilai22@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,gmx.de,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70F246B5DB0

On Mon, Jun 22, 2026 at 06:25:05PM +0300, Amit Barzilai wrote:
> The Solomon SSD1351 is a 128x128 RGB color OLED controller. It shares
> the SSD133X data path: a column/row addressing window followed by a bulk
> RGB565 pixel write. Add it as a new SSD135X_FAMILY rather than a separate
> driver, reusing the SSD133X plane, CRTC and blit/clear helpers.
> 
> The only data-path difference is that the SSD1351 requires an explicit
> Write RAM command (0x5c) after the address window is programmed, before
> pixel data is accepted, whereas the SSD133X enters data mode implicitly.
> This is emitted from a shared ssd133x_write_pixels() helper so both the
> damage-update and clear-screen paths cover it.
> 
> The SSD1351 also needs its own init sequence (ssd135x_init), dispatched
> via ssd135x_encoder_atomic_enable, and a longer post-reset settle delay.
> The re-map byte is fixed at 0 degrees, 65k color, COM split, BGR
> sub-pixel order; rotation is not supported.
> 
> The SSD1351 is SPI-only, so only the SPI transport match tables gain an
> entry; no new config symbol is needed.

...

> const struct ssd130x_deviceinfo ssd130x_variants[] = {

>  		.default_height = 64,
>  		.format_rgb565 = 1,
>  		.family_id = SSD133X_FAMILY,
> +	},
> +	/* ssd135x family */
> +	[SSD1351_ID] = {
> +		.default_width = 128,
> +		.default_height = 128,
> +		.format_rgb565 = 1,
> +		.family_id = SSD135X_FAMILY,
>  	}

While it's not a problem _in this case_, the rule of thumb is always to have a
trailing comma for non-terminator entry.

...

>  /*
>   * Helper to write data (SSD13XX_DATA) to the device.
>   */
> -static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
> +static int ssd130x_write_data(struct ssd130x_device *ssd130x, const u8 *values, int count)
>  {
>  	return regmap_bulk_write(ssd130x->regmap, SSD13XX_DATA, values, count);
>  }

Stray change. If needed, either explain in the commit message or create
a separate patch (depending on the dependencies).

...

>  	unsigned int i;
>  	int ret;
>  
> +	/*
> +	 * The SSD135X family latches command parameters with D/C# HIGH (i.e.
> +	 * clocked in as data), unlike the other families where the opcode and
> +	 * all of its parameters are sent as commands (D/C# LOW). Send the
> +	 * opcode as a command and any following parameter bytes as data.
> +	 */
> +	if (ssd130x->device_info->family_id == SSD135X_FAMILY) {
> +		if (len == 0)
> +			return 0;
> +		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, cmd[0]);
> +		if (ret || len == 1)
> +			return ret;
> +
> +		return ssd130x_write_data(ssd130x, cmd + 1, len - 1);
> +	}

>  	for (i = 0; i < len; i++) {

This loop seems for the len, so it will be the same for both devices as far as
I can see the context. I can't find this piece in the original driver, perhaps
it's some dependency?

>  		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, cmd[i]);
>  		if (ret)

...

> +/*
> + * Variadic wrapper around ssd130x_write_cmds(). The first variadic argument is
> + * the command opcode and the following ones are its options/parameters.
> + */
> +static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
> +			     /* u8 cmd, u8 option, ... */...)
> +{
> +	u8 buf[8];
> +	va_list ap;
> +	int i;
> +
> +	if (count > ARRAY_SIZE(buf))
> +		return -EINVAL;
> +
> +	va_start(ap, count);

> +	for (i = 0; i < count; i++)

Can be

	for (int i = 0; i < count; i++)

> +		buf[i] = va_arg(ap, int);
> +	va_end(ap);
> +
> +	return ssd130x_write_cmds(ssd130x, buf, count);
> +}

...

> +static int ssd135x_init(struct ssd130x_device *ssd130x)
> +{
> +	/*
> +	 * Horizontal address increment, COM split, reversed COM scan direction,
> +	 * BGR sub-pixel order and 65k (RGB565) color depth. Rotation is not
> +	 * supported, so the remap byte is fixed.
> +	 */
> +	u8 remap = SSD135X_SET_REMAP_65K | SSD135X_SET_REMAP_COM_SPLIT |
> +		   SSD135X_SET_REMAP_COLOR_BGR | SSD135X_SET_REMAP_COM_SCAN;

> +	const u8 cmds[] = {

Why not static?

> +		2, SSD135X_SET_COMMAND_LOCK, 0x12,
> +		2, SSD135X_SET_COMMAND_LOCK, 0xb1,
> +		1, SSD13XX_DISPLAY_OFF,
> +		2, SSD135X_SET_CLOCK_FREQ, 0xf1,
> +		2, SSD135X_SET_MUX_RATIO, ssd130x->height - 1,
> +		3, SSD135X_SET_COL_RANGE, 0x00, ssd130x->width - 1,
> +		3, SSD135X_SET_ROW_RANGE, 0x00, ssd130x->height - 1,
> +		2, SSD135X_SET_DISPLAY_START, 0x00,
> +		2, SSD135X_SET_DISPLAY_OFFSET, 0x00,
> +		2, SSD135X_SET_GPIO, 0x00,
> +		2, SSD135X_SET_FUNCTION, 0x01,
> +		2, SSD135X_SET_PHASE_LENGTH, 0x32,
> +		4, SSD135X_SET_VSL, 0xa0, 0xb5, 0x55,
> +		2, SSD135X_SET_PRECHARGE, 0x17,
> +		2, SSD135X_SET_VCOMH_VOLTAGE, 0x05,
> +		4, SSD135X_SET_CONTRAST, 0xc8, 0x80, 0xc8,
> +		2, SSD135X_SET_CONTRAST_MASTER, 0x0f,
> +		2, SSD135X_SET_PRECHARGE2, 0x01,
> +		1, SSD135X_SET_DISPLAY_NORMAL,
> +		2, SSD13XX_SET_SEG_REMAP, remap,

> +		0,

No trailing comma for the terminator entry.

> +	};
> +
> +	/*
> +	 * ssd130x_power_on() issues a short reset pulse, but the SSD1351 is not
> +	 * ready to accept commands immediately afterwards. Give the controller
> +	 * time to settle before sending the init sequence.
> +	 */

Any reference to the datasheet?

> +	msleep(120);
> +
> +	return ssd130x_run_cmd_seq(ssd130x, cmds);
> +}

...

> +/*
> + * Write a run of pixel data to the controller's display RAM. The SSD135X
> + * family requires an explicit Write RAM command once the address window has
> + * been set, before any pixel data is accepted; the SSD133X family enters data
> + * mode implicitly after the column/row range is programmed.
> + */
> +static int ssd133x_write_pixels(struct ssd130x_device *ssd130x,
> +				u8 *data_array, unsigned int count)
> +{
> +	if (ssd130x->device_info->family_id == SSD135X_FAMILY) {

> +		int ret = ssd130x_write_cmd(ssd130x, 1, SSD135X_WRITE_RAM);
> +
> +		if (ret < 0)
> +			return ret;

This style is discouraged as it's harder to maintain. Better to split
assignment and definition

		int ret;

		ret = ssd130x_write_cmd(ssd130x, 1, SSD135X_WRITE_RAM);
		if (ret < 0)
			return ret;

> +	}
> +
> +	return ssd130x_write_data(ssd130x, data_array, count);
> +}

...

> static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs[]

>  		.atomic_check = ssd133x_primary_plane_atomic_check,
>  		.atomic_update = ssd133x_primary_plane_atomic_update,
>  		.atomic_disable = ssd133x_primary_plane_atomic_disable,
> +	},
> +	[SSD135X_FAMILY] = {
> +		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +		.atomic_check = ssd133x_primary_plane_atomic_check,
> +		.atomic_update = ssd133x_primary_plane_atomic_update,
> +		.atomic_disable = ssd133x_primary_plane_atomic_disable,
>  	}

As per another similar case.

>  };

...

> static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs[] = {

>  	[SSD133X_FAMILY] = {
>  		.atomic_enable = ssd133x_encoder_atomic_enable,
>  		.atomic_disable = ssd130x_encoder_atomic_disable,
> +	},
> +	[SSD135X_FAMILY] = {
> +		.atomic_enable = ssd135x_encoder_atomic_enable,
> +		.atomic_disable = ssd130x_encoder_atomic_disable,
>  	}
>  };

Ditto.

...


> diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
> index b0b487c06e04..da89d4455270 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.h
> +++ b/drivers/gpu/drm/solomon/ssd130x.h
> @@ -26,7 +26,8 @@
>  enum ssd130x_family_ids {
>  	SSD130X_FAMILY,
>  	SSD132X_FAMILY,
> -	SSD133X_FAMILY
> +	SSD133X_FAMILY,
> +	SSD135X_FAMILY

Ditto, and this is exactly the whole point why non-terminator entries should
have a trailing comma.

>  };

...

>  enum ssd130x_variants {

>  	SSD1327_ID,
>  	/* ssd133x family */
>  	SSD1331_ID,
> +	/* ssd135x family */
> +	SSD1351_ID,
>  	NR_SSD130X_VARIANTS

See the difference? Here is terminator, which is clear. The above cases are
not.

>  };

-- 
With Best Regards,
Andy Shevchenko



