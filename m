Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2DD6623CE
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Jan 2023 12:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234266AbjAILGn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 9 Jan 2023 06:06:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233686AbjAILGm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 9 Jan 2023 06:06:42 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E7CD2FE
        for <linux-fbdev@vger.kernel.org>; Mon,  9 Jan 2023 03:06:39 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id ja17so5975186wmb.3
        for <linux-fbdev@vger.kernel.org>; Mon, 09 Jan 2023 03:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjRwbpuBx9A4o4cRoFcJqEE5mXsy0UsyNYHbW5KtG4M=;
        b=YnQ3fGmpuRUapOzbtVRlN3HBT8Iorta3LecpdB0log7XED7u1IJxEqQs0QccmZxOai
         MfS/ZZSQ5WKDa9o6C1cGRqmSlALsDF7dYw8bC0mLYpQtTD17RkfW4+nHFkmXWXMpmBze
         LZwVtCyv46vyu0ZifdpdHibLyN3SfkifcK+AXWfJG2T0iyPzAA9pLINli7HH1gS+p9g3
         O+B5gLSVUqo8PEgDoBB9hhiNpI9OFz7Cq+mzvc+xnE3YYo3cKvbMrMpNiAgcOYu4257/
         //cyEe3wFJV/FzRNJeYb81OLG4xcEJtdkHClXQjHgPbLWfvpN3QzLV2BDagvGkziL0gK
         obhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjRwbpuBx9A4o4cRoFcJqEE5mXsy0UsyNYHbW5KtG4M=;
        b=twEyph5x02jX5ao9syb2tsg3KcEg+mwH6E6XfoPn3/dX325K5pUHvOT1MYIHRcF0KC
         GcVFa2XFLgRBSV/cH65S4kyuKLJAd+B0CgT32mqg0g3L4aPKUTEhPPpL09kdW49gSi/3
         dyHDJ4g3q5KcH952hSl+djuz3BDACWrlGFp4euUnl4ZXUFFoY9Ez16OHKGhqhbUEkxAA
         gsSfceo/9RWO4cr6VJ3FHJ3Zu3wWC290c781Z/6dgdzKHAvKMaLGGhev+HlJ2X1wlBq0
         lET5x2T+cnbDeH31aMgzAT0q7sddkhLl1TVeYXIREfKuEZpta9Nmevjbyy3uJRVsU7Ku
         XGGA==
X-Gm-Message-State: AFqh2koDyPrOwJwHrVs5RLcnMFC/KV5wSMO6gn8iEexcvVbr0oXDxcnj
        Svblq0zpn/53q8pqe12Iy+Ev0g==
X-Google-Smtp-Source: AMrXdXshcTe7Yre9OY4C4E6jNr30wzlSQe0BxicvczyjAULATvXvRnPw2diLMpZVvSEBR8IGX/Vbtw==
X-Received: by 2002:a05:600c:3550:b0:3d9:ed30:6a73 with SMTP id i16-20020a05600c355000b003d9ed306a73mr3129624wmq.9.1673262397923;
        Mon, 09 Jan 2023 03:06:37 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12453314wmj.14.2023.01.09.03.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:06:37 -0800 (PST)
Date:   Mon, 9 Jan 2023 11:06:35 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     sam@ravnborg.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Helge Deller <deller@gmx.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Antonino Daplas <adaplas@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>, Lee Jones <lee@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y7v1OxdowGdxgvUj@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sat, Jan 07, 2023 at 07:26:29PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>
> With all users gone remove the deprecated fb_blank member in
> backlight_properties.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>


Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


PS Please don't treat this like a maintainer Acked-by: and merge it
   (Lee's not on holiday so work with Lee to figure out the merge
   strategy ;-) ).
