Return-Path: <linux-fbdev+bounces-1159-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4285B720
	for <lists+linux-fbdev@lfdr.de>; Tue, 20 Feb 2024 10:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEBB91C242A5
	for <lists+linux-fbdev@lfdr.de>; Tue, 20 Feb 2024 09:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09495F48B;
	Tue, 20 Feb 2024 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzeibqOF"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4CE60ECB
	for <linux-fbdev@vger.kernel.org>; Tue, 20 Feb 2024 09:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708420714; cv=none; b=Y+qqD1bZYVQI4SsfdpmNa9K61N+odv2aFc1rjLa5bzq2Qd8smfW6lQKudGkmCf+MB32OhAFR/pkspB8USlMLQL/9peuuQ+R9aerqKoF4g2fHoay/oLvsqmCjmw3dw934IBCyTF6If8LKtTKhht6jrmnUrqRR20PF0+VrZAgkG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708420714; c=relaxed/simple;
	bh=Pjpym6pBWsftiIYC3BXDjxDftaIjTZrVIrPNdDqVV+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZR/JAT8visOOq9crN9mc159W5BseRNk744bXktGjKh2fMbalTwipiykaBquL80QmW/kVhBtB26sLbVRl6Y55LKXYIF3tCeL6zZLV5jBHJtOmAudZkEg2M77NtPZVOqeG3q1057vF/x3XwwzNYRhU+J0+7EN1/xP8kLIV8oX2KGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzeibqOF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708420712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vkzby9wfQQhUZRcpTbjHhp7P8uZMSLkRfL4T/QvrGZM=;
	b=fzeibqOFR6I0bPKENMFbyZu99C1K7QyPoXCFajwmIV1UIhT0imIg0ngad+Ers4txEZqgqX
	tlH4D+U2kQi7IBFjR1OZGVzQq3ql6XF1Tm1lJzp7Dd1RzSWK6Z/m43V+7TKqgCgDGd2Lbj
	DWEtPDCBhcBuy9ZIGWUCK62ecjoM6IU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-8SsjARYRMnmNk4qhy_VM3A-1; Tue, 20 Feb 2024 04:18:30 -0500
X-MC-Unique: 8SsjARYRMnmNk4qhy_VM3A-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-512a9c0c05cso2261857e87.1
        for <linux-fbdev@vger.kernel.org>; Tue, 20 Feb 2024 01:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708420709; x=1709025509;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkzby9wfQQhUZRcpTbjHhp7P8uZMSLkRfL4T/QvrGZM=;
        b=N+2kmEo23vf5Lkg0dCAabqHKr4xk7U6B16YK9ADHNQ3ohMfkpho4kVGRgPDQlatNEu
         bOtmn1HTLy0OiNCZyT84qsUfDGWWW39sN2j0jLQVTOdgT35hIo0r4INZy3VhdBcILDLq
         knx3QJGibVSFw63Zhxe7TwjN4kJNSrnYPbFm3CzkAT/XeJ7HoQBWUgWoCSDU+jISiZPu
         zrbaOZJz4/ZsCnB0N/lIJdYZYV/m/mkBjpJV+wouIJhRH2qAQtIlFLXNxhaNa8lxX1Ap
         hh9Mfnb+oS/CgfWWiVUvuJ5b4WeuT3Go4cgdUuIqYnbsiFJcbn+qwr1IxWjFlTMdfGdg
         cqNA==
X-Forwarded-Encrypted: i=1; AJvYcCWqXOIJk8Kd2bbsxC0CG6XSP0SxLlQ7hCtnZLgd+DntzZcmEWDvFnV5faMTmbj9LdokC0soRMG3aqhp2YCUgJ5seuhSFmAZns5LTA8=
X-Gm-Message-State: AOJu0YyVBvwWovUGgydEpBlET6k7IZAX3VlXRcOWfJeAkFUfKtmR/6eR
	ZrntTsQnTopmIqAP7FQsAiNOwO4sQyRUy2NCqMXDQUT5r0Hf/imSDUuFj2Rr/VIcbElI6YALHWF
	meta4Koap6qL0iRsPLV5A0CRRR8IFyxRiEfT+DqNLcG+lybLFVMYtLw5w/kx7
X-Received: by 2002:a05:6512:159:b0:512:a93a:f5a1 with SMTP id m25-20020a056512015900b00512a93af5a1mr4334353lfo.36.1708420708952;
        Tue, 20 Feb 2024 01:18:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEEqm11cyvxMjF1g+2iM0xRpkZ3M4fWTa6V4c4a2kufWdQQu89dk7xHknoOQDeqxrJBoK9pA==
X-Received: by 2002:a05:6512:159:b0:512:a93a:f5a1 with SMTP id m25-20020a056512015900b00512a93af5a1mr4334341lfo.36.1708420708638;
        Tue, 20 Feb 2024 01:18:28 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c445500b0041266f5b041sm5575587wmn.34.2024.02.20.01.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:18:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH 02/10] auxdisplay/ht16k33: Remove struct
 backlight_ops.check_fb
In-Reply-To: <20240212162645.5661-3-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-3-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:18:27 +0100
Message-ID: <878r3fjxy4.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver sets struct fb_info.bl_dev to the correct backlight
> device. Thus rely on the backlight core code to match backlight
> and framebuffer devices, and remove the extra check_fb function
> from struct backlight_ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Robin van der Gracht <robin@protonic.nl>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


