Return-Path: <linux-fbdev+bounces-3751-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE1A2D926
	for <lists+linux-fbdev@lfdr.de>; Sat,  8 Feb 2025 23:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E73BC3A5BA5
	for <lists+linux-fbdev@lfdr.de>; Sat,  8 Feb 2025 22:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752A9241CBA;
	Sat,  8 Feb 2025 22:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=truemaisha.co.tz header.i=@truemaisha.co.tz header.b="w53jAR72"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from server-598995.kolorio.com (server-598995.kolorio.com [162.241.152.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BB6241C9B
	for <linux-fbdev@vger.kernel.org>; Sat,  8 Feb 2025 22:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.241.152.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739052353; cv=none; b=XActfEDgZCS4wR7oOpqn4cKQnUfTu4TLgmGIhMQzfu41ZRnkPzi0SRghPAdJVy1MrfaD4opKqOjf9Vf2mC1YhaNvaYWz9KgCBfIhImge6VTM9kP6D9LYxGeTeYgFME59yCBFnNqP4KtecLN3J2BOqK85bfD2knHNtJhf2pK2v1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739052353; c=relaxed/simple;
	bh=gl4+7vNxgV9+JzZtw7EthQ6aGDgi0WVn3wQV/lnKiyo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dFHUABnA83HLuMSkt/zztbnnx8NebcDXhKbmv1rlcNqEUUSSRQv0zQBU/7bBffkCCx2FULxhG81ubLG/8peXz/OZEi/hNm4GHhfKL6vwT0et3qwN/wzk2nVB7RjVbsVRr/lvClwBZzvXWMW0P6f8RgW/nlt8vMjQekswajTQpCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=truemaisha.co.tz; spf=pass smtp.mailfrom=truemaisha.co.tz; dkim=pass (2048-bit key) header.d=truemaisha.co.tz header.i=@truemaisha.co.tz header.b=w53jAR72; arc=none smtp.client-ip=162.241.152.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=truemaisha.co.tz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truemaisha.co.tz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=truemaisha.co.tz; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gl4+7vNxgV9+JzZtw7EthQ6aGDgi0WVn3wQV/lnKiyo=; b=w53jAR72lCSkyX+yTz1/NR5wJB
	A/QHxrGC9fYsSzu+tkmyGBrQWQ/c+d1TaWqIwg674ezNCAAgZfz5gJqrHikekYA+vDj0m4gZFISir
	s6b0tqyiYgKopVxEzf9XehF/2l+StUZD5fNkhwibbxBIAQBN+WRhVapy5HuqsAD9VNhDZYn48XPpw
	pFgl7lMDMBBi48fN9l25hLNwgBGWpxl038G+Myp/UhLoAdGXSKj79MbUbyQ/AxJ4VQ18T44ZLz3Ai
	vefgNws5tBL2hMWlRFoWNeLJOunmGF6eDedoev2lKMaUqhXO77ydi2Vd5AIICxLYDEAcBufYNP63j
	Pgszd6Yg==;
Received: from [74.208.124.33] (port=59533 helo=truemaisha.co.tz)
	by server-598995.kolorio.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <chrispinerick@truemaisha.co.tz>)
	id 1tgsxP-0001nb-2l
	for linux-fbdev@vger.kernel.org;
	Sat, 08 Feb 2025 16:05:49 -0600
Reply-To: dsong@aa4financialservice.com
From: David Song <chrispinerick@truemaisha.co.tz>
To: linux-fbdev@vger.kernel.org
Subject: Re: The business loan- 
Date: 08 Feb 2025 22:05:50 +0000
Message-ID: <20250208210542.0D0AD12DEED9D945@truemaisha.co.tz>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server-598995.kolorio.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - truemaisha.co.tz
X-Get-Message-Sender-Via: server-598995.kolorio.com: authenticated_id: chrispinerick@truemaisha.co.tz
X-Authenticated-Sender: server-598995.kolorio.com: chrispinerick@truemaisha.co.tz
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hello,

My name is David Song, at AA4 FS, we are a consultancy and
brokerage Firm specializing in Growth Financial Loan and joint
partnership venture. We specialize in investments in all Private
and public sectors in a broad range of areas within our Financial
Investment Services.

 We are experts in financial and operational management, due
diligence and capital planning in all markets and industries. Our
Investors wish to invest in any viable Project presented by your
Management after reviews on your Business Project Presentation
Plan.

 We look forward to your Swift response. We also offer commission
to consultants and brokers for any partnership referrals.

 Regards,
David Song
Senior Broker

AA4 Financial Services
13 Wonersh Way, Cheam,
Sutton, Surrey, SM2 7LX
Email: dsong@aa4financialservice.com


