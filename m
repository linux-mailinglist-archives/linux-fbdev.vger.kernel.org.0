Return-Path: <linux-fbdev+bounces-2116-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE308AB5AC
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 21:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 008AF1F226FF
	for <lists+linux-fbdev@lfdr.de>; Fri, 19 Apr 2024 19:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA7013C906;
	Fri, 19 Apr 2024 19:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ArDITvpK"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E6725740
	for <linux-fbdev@vger.kernel.org>; Fri, 19 Apr 2024 19:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713555825; cv=none; b=EN1w+iOy3waXcvJa3T/AGr1I+/jJfGJINhcxPk2KfCofMt7kim5RP0lIUsayuRxvtrZlCVD0EAjTFP6JMFv5GRSXHRN4OrWLTzs47OMvjC40ZJ7BnHBfq5L+31sunEBW/UDinBKiYkhCJ5R8eXzknucm5pDTz1jOC+dwiUWJayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713555825; c=relaxed/simple;
	bh=/umTCUxm8+W904+v+ViwAy21eFv5gR2kI/1bx+ePXvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fptR1VybwR3kEeroLrhdMvhE6EUbIY9tz1xuQRsq6s3R+GWLRr57J8V9fzfb9goEqVn85DVolWbcZTDe0udUtt4oG/ioFnzG746ZXT0+PgEe/djzDNl1QYa/Kff2ClYQPPbaeDhABxVaoilrQOpc1HiJAQ66yTHcpAg3hJwIGGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ArDITvpK; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d8863d8a6eso36374111fa.3
        for <linux-fbdev@vger.kernel.org>; Fri, 19 Apr 2024 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713555822; x=1714160622; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9n8w+k/Rz2KhRS1lWM0onkwMbYnSnsUvM19FbIPwAXY=;
        b=ArDITvpKJtKjPzAoNhL0fIePDl8EJqty6ikRCam+jkXo7yhyBHp4reTCdsOX0kpmvI
         PjEz/3qosFtMfhmPiSv+QkxjsO3A1E/7Nv7eBorshSAFHjRRLPZ+HO5PkVrJ9hF+HlFA
         kv5w8N/CA/E0y4YWb/PEf/JNwN3ZFj4bHTBi99u8+RIgDF2SvvTljSJIEkDSF1Lc6JWd
         aiRqPc8V70wL0amnGjNNletP2EUjPC4Na95iywa2oS5GFQ4zk9CWqC3uM8nY1O/+t3k5
         WzZ6ke2sSJO5mybyAyB6cocDRLgBMrMR7fMOFd+iWm7p/kw9kXzGpjhB29EoSMU+l0St
         Q3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713555822; x=1714160622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9n8w+k/Rz2KhRS1lWM0onkwMbYnSnsUvM19FbIPwAXY=;
        b=I/k5VsfyxwGe2t0MnV8dD/btDdYEpe1Q0lKUvmjYTdLJSvouBWiyUU1cOVXkMzd3pa
         8r++XT59cXVRe2ElXJlkRjX18b+mgAUj6g8MoECDnOSJga4ORarowN+mNgQqqcAjPJtO
         jAqoWtQ0jmpOjEsn1thUrYmORSwttOthBv9lZPYlrUnoOLy3EJ07Bh+U+Vd0uXWRuv7G
         Ow2Cgn/P6c5tKQcFRpWJ/qxl2wy9eS76EAC0/oGBIPZOYS03+GHaSJobsYydrRep3Szz
         roVtyEd6KcVRlcynG59hV1gE1KewMlIMaXyhi4KGrzumC8+Dke66mH5AA9UF5UCy6cMx
         3PEw==
X-Forwarded-Encrypted: i=1; AJvYcCX4cuHJ8Kr81Bi/lc0thrGOPsVveUoNyMftpI93w9yzBhC+buGZz619THdYiHqACdih511tnG2WlZ/LOFJqkQr6xDJ6dz9WjRjsnCw=
X-Gm-Message-State: AOJu0YzVccMi65dDgv+f/YBey/GClpKp5G6spVFAcJslChQuMCWFYNqd
	J2XISit/KWSTgxBPRx5eQwlQ7Wve7ONnVQzLwkieCS6nmA2huCyxKm1jHmorJ7Y=
X-Google-Smtp-Source: AGHT+IGcBUNiOzrCx5bOhksZzXhutpA6zE+59J4ho4DswlvXGTgc/C2PjsXBWOqbG5K4nsFd3zM/2g==
X-Received: by 2002:a2e:8195:0:b0:2da:4bf:ab14 with SMTP id e21-20020a2e8195000000b002da04bfab14mr2470965ljg.45.1713555821866;
        Fri, 19 Apr 2024 12:43:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id u35-20020a05651c142300b002dd1279c133sm36469lje.10.2024.04.19.12.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 12:43:41 -0700 (PDT)
Date: Fri, 19 Apr 2024 22:43:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: daniel.thompson@linaro.org, deller@gmx.de, 
	dri-devel@lists.freedesktop.org, javier.carrasco.cruz@gmail.com, jingoohan1@gmail.com, 
	julia.lawall@inria.fr, lee@kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH][next] drivers: video: Simplify device_node cleanup using
 __free
Message-ID: <yelspf4hfmmj3lnk3exyc6tm2lrsqlet623q2s5zrm2unba6nw@43ewuqdzckdg>
References: <20240419111613.GA12884@aspen.lan>
 <819a56c3-bbaf-4d5e-87de-78c1312c56d1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <819a56c3-bbaf-4d5e-87de-78c1312c56d1@gmail.com>

On Sat, Apr 20, 2024 at 12:22:41AM +0530, Shresth Prasad wrote:
> 
> > Please fix the subject line to be "backlight: <driver>: ...". I came
> > very close to deleting this patch without reading it ;-) .
> 
> Really sorry about that, I'll fix it.
> 
> > Do we need to get dev->of_node at all? The device, which we are
> > borrowing, already owns a reference to the node so I don't see
> > any point in this function taking an extra one.
> >
> > So why not simply make this:
> >
> > ��� struct device_node *np = dev->of_node;
> 
> Looking at it again, I'm not sure why the call to `of_node_put` is there in the first place. I think removing it will be fine.
> 
> I'll fix both of these issues and send a patch v2.

Just a stupid quesiton: on which platform was this patch tested?

-- 
With best wishes
Dmitry

