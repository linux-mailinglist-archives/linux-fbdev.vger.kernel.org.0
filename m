Return-Path: <linux-fbdev+bounces-486-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A925826ACA
	for <lists+linux-fbdev@lfdr.de>; Mon,  8 Jan 2024 10:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B14A51C21AAE
	for <lists+linux-fbdev@lfdr.de>; Mon,  8 Jan 2024 09:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0C5D51B;
	Mon,  8 Jan 2024 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gS1kVwlA"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE611C87
	for <linux-fbdev@vger.kernel.org>; Mon,  8 Jan 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704706536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8FqI91Plpg4t0tN2+40oiwSiAXoVjsNtxVtGTkjkFNk=;
	b=gS1kVwlA6GKErMRMpaP/Ki61MvKzMoUAICK++EBaaWBJ2rp47T8RDRJjUHUsuvUbRyOrv6
	5jjL/aDp4/A4K18P7zUDPw22/mlIBaqc2Kq8n5oSRdbBJ2DtwgE2Adg6IwCs469KvItej6
	1K3lO3YGIkRI0Zx/ZBjUh7IkfD8bHfg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-xoOADUyzOA6lULgNiRkhhw-1; Mon, 08 Jan 2024 04:35:34 -0500
X-MC-Unique: xoOADUyzOA6lULgNiRkhhw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-336c3c777ffso1090121f8f.2
        for <linux-fbdev@vger.kernel.org>; Mon, 08 Jan 2024 01:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704706533; x=1705311333;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8FqI91Plpg4t0tN2+40oiwSiAXoVjsNtxVtGTkjkFNk=;
        b=fkXM5JifzeemBoscp3kuwVRCT1HBJJGm+ulKjM/t6GFWpvOWWeLMCBLwv7A72Dt95l
         Rj2lekXGaXBJd2Qh0cfK674jjhZF854oj55/cDK1AMfUfrSsJ/gdaN7lUJgENks5RIX1
         U93//mv1pzj/Ty2NGk/WdIRnr4Ltohb5tJN35hb9A3mfvjS4L2K22YU51tEGWUR0kOth
         AIrTAmnO+PQWMPkL0eVov6UGhNpLOH6Ws7j7a77TbUaTjq7f7TcEKu8YuhlPGJwDbn2X
         ogOknQwnzHpsuhfHEpa1gA2zw8AcwLqESQfPhtKOSTQMg7YElsJaqcKSU9MK8IW9tmJo
         8mgA==
X-Gm-Message-State: AOJu0Yyiyfnj/Q7iectY1VDJk8DLsw4uNQ4W535FGRBdCxFfbepdOrIC
	41gY5qoEiGG594Tgyq7+JQdbdkyBA/lYRWCSTkNyFIoRQomzxxsrYJHzfu0rC+Q3KVDleB1ibXi
	6ZMRIlx61uzm/HBB/R4IvITMNjS0ixOA=
X-Received: by 2002:a05:600c:470a:b0:40d:8964:7eb4 with SMTP id v10-20020a05600c470a00b0040d89647eb4mr1648561wmo.35.1704706533651;
        Mon, 08 Jan 2024 01:35:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9LrFAdz2c0oUKOXqiCz9V6sA9/SRyB+6xOvPQWIK9QOb6WfX0qmqi60bY3HX68Bx+qm7YvA==
X-Received: by 2002:a05:600c:470a:b0:40d:8964:7eb4 with SMTP id v10-20020a05600c470a00b0040d89647eb4mr1648548wmo.35.1704706533379;
        Mon, 08 Jan 2024 01:35:33 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r14-20020a05600c35ce00b0040e48abec33sm1470139wmq.45.2024.01.08.01.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 01:35:33 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, drawat.floss@gmail.com,
 deller@gmx.de, decui@microsoft.com, wei.liu@kernel.org,
 haiyangz@microsoft.com, kys@microsoft.com, daniel@ffwll.ch,
 airlied@gmail.com
Cc: linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/4] firmware/sysfb: Clear screen_info state after
 consuming it
In-Reply-To: <20240103102640.31751-4-tzimmermann@suse.de>
References: <20240103102640.31751-1-tzimmermann@suse.de>
 <20240103102640.31751-4-tzimmermann@suse.de>
Date: Mon, 08 Jan 2024 10:35:32 +0100
Message-ID: <874jfodv6j.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> After consuming the global screen_info_state in sysfb_init(), the
> created platform device maintains the firmware framebuffer. Clear
> screen_info to avoid conflicting access. Subsequent kexec reboots
> now ignore the firmware framebuffer.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


